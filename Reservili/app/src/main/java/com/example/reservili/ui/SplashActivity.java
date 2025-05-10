package com.example.reservili.ui;



import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;

import com.example.reservili.MainActivity;
import com.example.reservili.R;

public class SplashActivity extends AppCompatActivity {

    private static final String TAG = "SplashActivity";
    private View splashView;
    private ImageView splashLogo;
    private TextView splashName;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Log.d(TAG, "onCreate: Starting SplashActivity");
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            getWindow().setStatusBarColor(android.graphics.Color.WHITE);
            Log.d(TAG, "onCreate: Set status bar to white");
        }
        setContentView(R.layout.activity_splash);

        // Use the root view of the layout
        splashView = findViewById(R.id.splash_root);
        if (splashView == null) {
            Log.e(TAG, "onCreate: splashView is null, falling back to content view");
            splashView = findViewById(android.R.id.content);
        }
        splashLogo = findViewById(R.id.splash_logo);
        splashName = findViewById(R.id.splash_name);

        // Fade-in animation for logo and name
        Log.d(TAG, "onCreate: Starting fade-in animation for logo and name");
        splashLogo.setAlpha(0f);
        splashName.setAlpha(0f);
        splashLogo.animate().alpha(1f).setDuration(500).start();
        splashName.animate().alpha(1f).setDuration(500).start();

        // Start fade animation for gradient background after delay
        splashView.postDelayed(() -> {
            Log.d(TAG, "postDelayed: Starting fade animation for gradient background");
            try {
                // Set the gradient background and fade it in
                splashView.setBackgroundResource(R.drawable.gradient_background);
                splashView.setAlpha(0f);
                splashView.animate()
                        .alpha(1f)
                        .setDuration(500)
                        .withEndAction(() -> {
                            Log.d(TAG, "fadeAnimation: Finished, starting MainActivity");
                            startMainActivity();
                        })
                        .start();
            } catch (Exception e) {
                Log.e(TAG, "postDelayed: Fade animation failed", e);
                // Fallback: Set background and go to MainActivity
                splashView.setBackgroundResource(R.drawable.gradient_background);
                startMainActivity();
            }
        }, 1000);
    }

    private void startMainActivity() {
        Log.d(TAG, "startMainActivity: Launching MainActivity");
        Intent intent = new Intent(SplashActivity.this, MainActivity.class);
        startActivity(intent);
        finish();
    }
}

