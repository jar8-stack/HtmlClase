<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>TEST</title>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@200;700&display=swap" rel="stylesheet">
    <link href="{{env("APP_URL")}}fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="{{env("APP_URL")}}boostrap/css/bootstrap.min.css" rel="stylesheet">
   
</head>

<body>

   HOLA
    @include('layout/footer')

<script src="{{env("APP_URL")}}jquery/jquery-min.js"></script>
</body>


</html>