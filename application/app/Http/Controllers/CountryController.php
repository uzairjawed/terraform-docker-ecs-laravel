<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;


class CountryController extends Controller
{
    
    private $supportedCountriesWithISO = [
        'spain' => 'ES',
        'uk' => 'GB',
        'ireland' => 'IE',
        'france' => 'FR',
    ];

    /**
     * Retrieve the name parameter and return the ISO.
     *
     * @param  int  $id
     * @return Response
     */
    public function get(Request $request)
    {
        $name = strtolower($request->get('name'));
        if (isset($name) && array_key_exists($name, $this->supportedCountriesWithISO)) {
            return response()->json([
                    'ISO' => $this->supportedCountriesWithISO[$name]
                ]
            );
        }

        return response()->json([
            'error' => 'Invalid Country Name'
        ], 400);
    }
}