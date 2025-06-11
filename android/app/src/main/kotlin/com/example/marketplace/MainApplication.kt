package com.example.marketplace

import android.app.Application
import com.yandex.mapkit.MapKitFactory

class MainApplication: Application() {
    override fun onCreate() {
        super.onCreate()
        MapKitFactory.setApiKey("87210689-aa6d-4f06-84b1-febe9d680c7b")
        MapKitFactory.initialize(this)
    }
}

