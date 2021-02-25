<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class checkMiCuentaRegistros
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next, $numRegistro)
    {
        // if (!$request->session()->exists('formRegistro'.$numRegistro)) {
            
        //     if (!$request->session()->exists('formRegistrosCompletos')) {
        //         return redirect("micuenta");
        //     }
        //     $formCompletos = $request->session()->get('formRegistrosCompletos');
        //     if (count($formCompletos) == 0) return redirect('registro7');    
        //      $keys = array_keys($formCompletos);
        //      $keyMax = $keys[count($keys)-1];
        //     return redirect($formCompletos[$keyMax]);
        // }

        return $next($request);
    }
}
