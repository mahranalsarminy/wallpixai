<?php

namespace App\Providers;

use App\Models\AdminNotification;
use App\Models\BlogArticle;
use App\Models\BlogCategory;
use App\Models\BlogComment;
use App\Models\Faq;
use App\Models\Feature;
use App\Models\FooterMenu;
use App\Models\GeneratedImage;
use App\Models\Language;
use App\Models\NavbarMenu;
use App\Models\SeoConfiguration;
use App\Models\Subscription;
use App\Models\Transaction;
use App\Models\User;
use Config;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    public function register()
    {
        $this->events();
    }

    public function boot()
    {
        if (config('system.install.complete')) {

            Paginator::useBootstrap();

            if (settings('actions')->language_type) {
                Config::set('laravellocalization.supportedLocales', getSupportedLocales());
            }

            view()->composer('*', function ($view) {
                $view->with(['settings' => settings()]);
            });

            if (!isAdminPath()) {

                if (settings('actions')->force_ssl_status) {
                    $this->app['request']->server->set('HTTPS', true);
                }

                view()->composer('*', function ($view) {
                    $languages = Language::orderBy('sort_id', 'asc')->get();
                    $view->with('languages', $languages);
                });

                view()->composer(['configurations.metaTags', 'home'], function ($view) {
                    $SeoConfiguration = SeoConfiguration::where('lang', getLang())->with('language')->first();
                    $view->with('SeoConfiguration', $SeoConfiguration);
                });

                view()->composer('includes.navbar', function ($view) {
                    $navbarMenuLinks = NavbarMenu::where('lang', getLang())->whereNull('parent_id')->with(['children' => function ($query) {
                        $query->byOrder();
                    }])->byOrder()->get();
                    $view->with('navbarMenuLinks', $navbarMenuLinks);
                });

                view()->composer('includes.faqs', function ($view) {
                    $faqs = Faq::where('lang', getLang())->limit(10)->get();
                    $view->with('faqs', $faqs);
                });

                view()->composer('includes.features', function ($view) {
                    $features = Feature::where('lang', getLang())->get();
                    $view->with('features', $features);
                });

                view()->composer('includes.articles', function ($view) {
                    $blogArticles = BlogArticle::where('lang', getLang())->limit(3)->orderByDesc('id')->get();
                    $view->with('blogArticles', $blogArticles);
                });

                view()->composer('blog.includes.sidebar', function ($view) {
                    $blogCategories = BlogCategory::where('lang', getLang())->get();
                    $popularBlogArticles = BlogArticle::where('lang', getLang())->orderbyDesc('views')->limit(8)->get();
                    $view->with(['blogCategories' => $blogCategories, 'popularBlogArticles' => $popularBlogArticles]);
                });

                view()->composer('includes.footer', function ($view) {
                    $footerMenuLinks = FooterMenu::where('lang', getLang())->whereNull('parent_id')->with(['children' => function ($query) {
                        $query->byOrder();
                    }])->byOrder()->get();
                    $view->with('footerMenuLinks', $footerMenuLinks);
                });

            }

            if (isAdminPath()) {

                view()->composer('*', function ($view) {
                    $adminLanguages = Language::all();
                    $view->with('adminLanguages', $adminLanguages);
                });

                view()->composer('admin.includes.header', function ($view) {
                    $adminNotifications = AdminNotification::orderbyDesc('id')->limit(20)->get();
                    $unreadAdminNotifications = AdminNotification::where('status', 0)->get()->count();
                    $unreadAdminNotificationsAll = $unreadAdminNotifications;
                    if ($unreadAdminNotifications > 9) {
                        $unreadAdminNotifications = "9+";
                    }
                    $view->with([
                        'adminNotifications' => $adminNotifications,
                        'unreadAdminNotifications' => $unreadAdminNotifications,
                        'unreadAdminNotificationsAll' => $unreadAdminNotificationsAll,
                    ]);
                });

                view()->composer('admin.includes.sidebar', function ($view) {
                    $unviewedUsersCount = User::where('is_viewed', 0)->count();
                    $commentsNeedsAction = BlogComment::where('status', 0)->get()->count();
                    $unviewedSubscriptions = Subscription::where('is_viewed', 0)->count();
                    $unviewedTransactionsCount = Transaction::where('is_viewed', 0)->whereIn('status', [2, 3])->count();
                    $unviewedGeneratedImages = GeneratedImage::where('is_viewed', 0)->notExpired()->count();
                    $view->with([
                        'unviewedUsersCount' => $unviewedUsersCount,
                        'commentsNeedsAction' => $commentsNeedsAction,
                        'unviewedSubscriptions' => $unviewedSubscriptions,
                        'unviewedTransactionsCount' => $unviewedTransactionsCount,
                        'unviewedGeneratedImages' => $unviewedGeneratedImages,
                    ]);
                });
            }
        }
    }

    public function events()
    {
        Event::listen(function (\SocialiteProviders\Manager\SocialiteWasCalled $event) {
            $event->extendSocialite('microsoft', \SocialiteProviders\Microsoft\Provider::class);
            $event->extendSocialite('vkontakte', \SocialiteProviders\VKontakte\Provider::class);
        });
    }
}
