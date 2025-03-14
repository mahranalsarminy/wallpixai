<?php

namespace App\Notifications\Subscriptions;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class SubscriptionAboutToExpiredNotification extends Notification
{
    use Queueable;

    public $subscription;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($subscription)
    {
        $this->subscription = $subscription;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->subject(mailTemplate('subscription_about_expired')->subject)
            ->markdown('vendor.emails.default', [
                'body' => mailTemplate('subscription_about_expired')->body,
                'short_codes' => [
                    '{{username}}' => $this->subscription->user->firstname,
                    '{{plan}}' => $this->subscription->plan->name,
                    '{{expiry_date}}' => dateFormat($this->subscription->expiry_at),
                    '{{link}}' => route('user.settings.subscription'),
                    '{{website_name}}' => settings('general')->site_name,
                ],
            ]);
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
