<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        $schedule->command('images:delete-expired')->everyMinute();
        $schedule->command('transactions:unpaid-delete')->hourly();

        $schedule->command('subscriptions:renew-free')->everyMinute();
        $schedule->command('subscriptions:expiring-reminder')->everyMinute();
        $schedule->command('subscriptions:expired-reminder')->everyMinute();
        $schedule->command('subscriptions:expired-delete')->hourly();

        $schedule->command('app:sitemap-generate')->daily();
    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__ . '/Commands');

        require base_path('routes/console.php');
    }
}