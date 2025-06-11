package com.example.marketplace // <-- o'zgartiring o'z package nomingizga

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        MapKitFactory.setApiKey("87210689-aa6d-4f06-84b1-febe9d680c7b") // <-- bu yerga sizning API kalitingiz

        super.onCreate(savedInstanceState)
    }
}
