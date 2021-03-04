<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class checkStartedSession
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if ($request->session()->exists('api-token')) {
            return redirect()->action(
                'App\Http\Controllers\MiCuentaController@misDatos'); 
        }
        return $next($request);
    }
}
