<?php
use App\Http\Controllers\Admin\FeaturedContentController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\MediaController;
use App\Http\Controllers\MediaRatingController;
use App\Http\Controllers\TagController;
use App\Http\Controllers\SearchController;
use App\Http\Controllers\MediaAnalyticsController;
use App\Http\Controllers\MediaReportController;
use App\Http\Controllers\CommentController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
 */

Route::get('cronjob', 'CronJobController@run')->name('cronjob')->middleware('demo:GET');
Route::view('maintenance', 'maintenance')->name('maintenance');
Route::group(localizeOptions(), function () {
    Route::middleware('maintenance')->group(function () {
        Route::name('ipn.')->prefix('ipn')->namespace('Gateways')->group(function () {
            Route::get('paypal_express', 'PaypalExpressController@ipn')->name('paypal_express');
            Route::get('stripe_checkout', 'StripeCheckoutController@ipn')->name('stripe_checkout');
            Route::get('mollie', 'MollieController@ipn')->name('mollie');
            Route::post('razorpay', 'RazorpayController@ipn')->name('razorpay');
        });

        Auth::routes(['verify' => true]);
        Route::get('cookie/accept', 'ExtraController@cookie')->middleware('ajax.only');
        Route::get('popup/close', 'ExtraController@popup')->middleware('ajax.only');

        Route::group(['namespace' => 'Auth'], function () {
            Route::get('login', 'LoginController@showLoginForm')->name('login');
            Route::post('login', 'LoginController@login');
            Route::post('logout', 'LoginController@logout')->name('logout');

            Route::middleware(['disable.registration'])->group(function () {
                Route::get('register', 'RegisterController@showRegistrationForm')->name('register');
                Route::post('register', 'RegisterController@register')->middleware('check.registration');
            });

            Route::name('oauth.')->prefix('oauth')->group(function () {
                Route::middleware('demo:GET')->group(function () {
                    Route::get('{provider}', 'OAuthController@redirectToProvider')->name('login');
                    Route::get('{provider}/callback', 'OAuthController@handleProviderCallback')->name('callback');
                });
                Route::middleware('auth')->group(function () {
                    Route::get('data/complete', 'OAuthController@showCompleteForm');
                    Route::post('data/complete', 'OAuthController@complete')->name('data.complete');
                });
            });

            Route::get('password/reset', 'ForgotPasswordController@showLinkRequestForm')->name('password.request');
            Route::post('password/email', 'ForgotPasswordController@sendResetLinkEmail')->name('password.email');
            Route::get('password/reset/{token}', 'ResetPasswordController@showResetForm')->name('password.reset');
            Route::post('password/reset', 'ResetPasswordController@reset')->name('password.update');

            Route::get('email/verify', 'VerificationController@show')->name('verification.notice');
            Route::post('email/verify/email/change', 'VerificationController@changeEmail')->name('change.email');
            Route::get('email/verify/{id}/{hash}', 'VerificationController@verify')->name('verification.verify');
            Route::post('email/resend', 'VerificationController@resend')->name('verification.resend');
        });

        Route::group(['namespace' => 'Auth', 'middleware' => ['auth', 'verified']], function () {
            Route::get('2fa/verify', 'TwoFactorController@show2FaVerifyForm')->name('2fa.verify');
            Route::post('2fa/verify', 'TwoFactorController@verify2fa');
        });

        Route::group(['prefix' => 'user', 'namespace' => 'User', 'middleware' => ['auth', 'oauth.complete', 'verified', '2fa.verify']], function () {
            Route::get('/', function () {
                return redirect()->route('user.gallery.index');
            });

            Route::name('checkout.')->prefix('checkout')->group(function () {
                Route::get('{checkout_id}', 'CheckoutController@index')->name('index');
                Route::post('{checkout_id}/coupon/apply', 'CheckoutController@applyCoupon')->name('coupon.apply');
                Route::post('{checkout_id}/coupon/remove', 'CheckoutController@removeCoupon')->name('coupon.remove');
                Route::post('{checkout_id}/proccess', 'CheckoutController@proccess')->name('proccess');
            });

            Route::name('user.')->group(function () {
                Route::name('gallery.')->prefix('gallery')->group(function () {
                    Route::get('/', 'GalleryController@index')->name('index');
                    Route::post('{id}/update', 'GalleryController@update')->name('update');
                    Route::delete('{id}', 'GalleryController@destroy')->name('destroy');
                });

                Route::name('settings.')->prefix('settings')->group(function () {
                    Route::get('/', 'SettingsController@index')->name('index');
                    Route::post('details/update', 'SettingsController@detailsUpdate')->name('details.update');
                    Route::get('subscription', 'SettingsController@subscription')->name('subscription');
                    Route::get('payment-history', 'SettingsController@paymentHistory')->name('payment-history');
                    Route::get('password', 'SettingsController@password')->name('password');
                    Route::post('password/update', 'SettingsController@passwordUpdate')->name('password.update');
                    Route::get('2fa', 'SettingsController@towFactor')->name('2fa');
                    Route::post('2fa/enable', 'SettingsController@towFactorEnable')->name('2fa.enable');
                    Route::post('2fa/disabled', 'SettingsController@towFactorDisable')->name('2fa.disable');
                });
            });
        });

        Route::middleware(['oauth.complete', 'verified', '2fa.verify'])->group(function () {
            Route::get('/', 'HomeController@index')->name('home');

            Route::name('images.')->prefix('images')->group(function () {
                Route::get('/explore', 'ImageController@index')->name('index');
                Route::post('generate', 'ImageController@generator')->name('generator');
                Route::get('{id}/view', 'ImageController@show')->name('show');
                Route::get('download/{id}/{name}', 'ImageController@download')->name('download');
            });

            Route::get('features', 'GlobalController@features')->name('features')->middleware('disable.features');

            Route::get('pricing', 'GlobalController@pricing')->name('pricing');
            Route::post('pricing/{id}/{type}', 'SubscribeController@subscribe')->name('subscribe');

            Route::name('blog.')->prefix('blog')->middleware('disable.blog')->group(function () {
                Route::get('/', 'BlogController@index')->name('index');
                Route::get('categories', 'BlogController@categories')->name('categories');
                Route::get('categories/{slug}', 'BlogController@category')->name('category');
                Route::get('articles', 'BlogController@articles');
                Route::get('articles/{slug}', 'BlogController@article');
                Route::post('articles/{slug}', 'BlogController@comment')->name('article');
            });

            Route::get('faqs', 'GlobalController@faqs')->name('faqs')->middleware('disable.faqs');

            Route::middleware('disable.contact')->group(function () {
                Route::get('contact-us', 'GlobalController@contact');
                Route::post('contact-us', 'GlobalController@contactSend')->name('contact');
            });

            if (config('system.install.complete') && !settings('actions')->language_type) {
                Route::get('{lang}', 'LocalizationController@localize')->where('lang', '^[a-z]{2}$')->name('localize');
            }

            Route::get('{slug}', 'GlobalController@page')->name('page');
        });
    });
});

// Media Rating Routes
Route::post('media/{media}/ratings', [MediaRatingController::class, 'store'])->name('media.ratings.store');

// Tag Routes
Route::get('tags/{tag}', [TagController::class, 'index'])->name('tags.index');

// Advanced Search Routes
Route::get('search', [SearchController::class, 'index'])->name('search');

// Media Analytics Routes
Route::get('media/{media}/analytics', [MediaAnalyticsController::class, 'show'])->name('media.analytics.show');

// Media Report Routes
Route::post('media/{media}/reports', [MediaReportController::class, 'store'])->name('media.reports.store');
Route::get('admin/reports', [MediaReportController::class, 'index'])->name('admin.reports.index');
Route::put('admin/reports/{report}', [MediaReportController::class, 'update'])->name('admin.reports.update');

// Comment Routes
Route::post('media/{media}/comments', [CommentController::class, 'store'])->name('comments.store');
Route::delete('comments/{comment}', [CommentController::class, 'destroy'])->name('comments.destroy');

// Authentication Routes
Auth::routes();

Route::prefix('admin')->name('admin.')->middleware(['auth', 'admin'])->group(function () {
    Route::get('featured-content', [FeaturedContentController::class, 'index'])->name('featured-content.index');
    Route::post('featured-content', [FeaturedContentController::class, 'store'])->name('featured-content.store');
});

Route::get('/', [HomeController::class, 'index'])->name('home.index');