<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Storage;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;

    use AuthorizesRequests, ValidatesRequests;
    public function saveImage($image, $path='public'){
        if(!$image){
            return null;
        }

        $filename = time().'.png';

        \Storage::disk($path)->put($filename, base64_decode($image));

        return URL::to('/').'/storage/'.$path.'/'.$filename;
    }
}
