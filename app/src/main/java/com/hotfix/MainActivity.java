package com.hotfix;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Toast;

import com.tinker.TinkerManager;

import java.io.File;

public class MainActivity extends AppCompatActivity {
    private String mPath;

//    note
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mPath = getExternalCacheDir().getAbsolutePath() + File.separatorChar + "patch_signed.apk";
    }

    /**
     * 加载Tinker补丁
     *
     * @param view
     */
    public void hotFix(View view) {
        File patchFile = new File(mPath);
        if (patchFile.exists()) {
            TinkerManager.loadPatch(mPath);
            Toast.makeText(this, "File Exists,Please wait a moment ", Toast.LENGTH_SHORT).show();
        } else {
            Toast.makeText(this, "File No Exists", Toast.LENGTH_SHORT).show();
        }
    }
}

