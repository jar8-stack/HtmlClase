<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class Checktoken
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

        if (!$request->session()->exists('api-token')) {
            return redirect('iniciodesesion');
        }
        return $next($request);
    }
}
