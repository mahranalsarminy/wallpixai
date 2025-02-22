<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Validator;

class TwoFactorController extends Controller
{
    public function show2FaVerifyForm()
    {
        if (authUser()->google2fa_status) {
            if (Session::has('2fa')) {
                return redirect()->route('user.gallery.index');
            }
        } else {
            return redirect()->route('user.gallery.index');
        }
        return view('auth.checkpoint.2fa');
    }

    public function verify2fa(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'otp_code' => ['required', 'numeric'],
        ]);
        if ($validator->fails()) {
            foreach ($validator->errors()->all() as $error) {
                toastr()->error($error);
            }
            return back();
        }
        $google2fa = app('pragmarx.google2fa');
        $valid = $google2fa->verifyKey(authUser()->google2fa_secret, $request->otp_code);
        if ($valid == false) {
            toastr()->error(lang('Invalid OTP code', 'auth'));
            return back();
        }
        Session::put('2fa', authUser()->id);
        return redirect()->route('user.gallery.index');
    }
}