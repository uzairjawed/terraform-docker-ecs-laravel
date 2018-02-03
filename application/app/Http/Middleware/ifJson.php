<?php

namespace App\Http\Middleware;

use Closure;

class ifJson
{
    /**
     * Run the request filter.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if ($request->wantsJson())
            return $next($request);

        return response()->json([
            'error' => 'Sorry, something went wrong.'
        ], 400);
    }

}