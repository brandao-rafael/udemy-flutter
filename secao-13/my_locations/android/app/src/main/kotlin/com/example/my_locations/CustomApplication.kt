package com.example.my_locations

import io.flutter.app.FlutterApplication
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor.DartEntrypoint
import io.flutter.plugin.common.MethodChannel

class CustomApplication : FlutterApplication() {
    override fun onCreate() {
        super.onCreate()
        val flutterEngine = FlutterEngine(this)
        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartEntrypoint.createDefault()
        )
        // Additional setup or initialization code if needed
    }
}
