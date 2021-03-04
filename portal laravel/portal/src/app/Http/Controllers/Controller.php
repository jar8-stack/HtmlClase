<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
   // use AuthorizesRequests, DispatchesJobs, ValidatesRequests;
   public function m_peticion_ajax_request($EndPont, $data_json, $POST = 1,$userApiToken = false){
		
		if ( $userApiToken == false){
			$APP_TOKEN = env("API_TOKEN_KEY");
		} else {
			$APP_TOKEN = $userApiToken;
		}
			
		$header = array('Content-Type: application/json','api-token:'.$APP_TOKEN);	
		$ch = curl_init($EndPont);
		$options = null;
		if($POST == 1){
			$options = array(
					CURLOPT_RETURNTRANSFER => true,     
					CURLOPT_HEADER         => false,    
					CURLOPT_FOLLOWLOCATION => false,    
					CURLOPT_AUTOREFERER    => true,     
					CURLOPT_CONNECTTIMEOUT => 20,       
					CURLOPT_TIMEOUT        => 20,       
					CURLOPT_POST            => 1,       
					CURLOPT_POSTFIELDS     => json_encode($data_json),   
					CURLOPT_SSL_VERIFYHOST => 0,          
					CURLOPT_SSL_VERIFYPEER => false,     
					CURLOPT_VERBOSE        => 1,
					CURLOPT_HTTPHEADER     => $header

			);
		}else{
			$options = array(
					CURLOPT_RETURNTRANSFER => true,     
					CURLOPT_HEADER         => false,    
					CURLOPT_FOLLOWLOCATION => false,    
					CURLOPT_AUTOREFERER    => true,     
					CURLOPT_CONNECTTIMEOUT => 20,       
					CURLOPT_TIMEOUT        => 20,       
					CURLOPT_SSL_VERIFYHOST => 0,          
					CURLOPT_SSL_VERIFYPEER => false,     
					CURLOPT_VERBOSE        => 1,
					CURLOPT_HTTPHEADER     => $header

			);
		}
		curl_setopt_array($ch,$options);
		$data = curl_exec($ch);
		$curl_errno = curl_errno($ch);
		$curl_error = curl_error($ch);        
		curl_close($ch);
		$response_data = json_decode($data, true);	
		return $response_data;
	}
	
	public function m_isValidEmail($email) {
		return filter_var($email, FILTER_VALIDATE_EMAIL) 
		&& preg_match('/@.+\./', $email);
	}
}
