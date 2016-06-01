package com.example.fern_computer.antidrugvolunteer;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ProgressBar;

public class Load extends AppCompatActivity {

    protected ProgressBar progressBar;
    protected boolean mbActive;
    protected static final int TIMER_RUNTIME = 10000;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_load);
        progressBar = (ProgressBar)findViewById(R.id.myProgressBar);
        final Thread timerThread = new Thread(){
            @Override
            public void run() {
                mbActive = true;
                try{
                    super.run();
                    int waited = 0;
                    while (mbActive && (waited < TIMER_RUNTIME)){
                        sleep(200);
                        if(mbActive){
                            waited += 200;
                            updateProgress(waited);
                        }
                    }
                }catch (InterruptedException e){

                }finally {

                    Intent i = new Intent(Load.this,
                            Login.class);
                    startActivity(i);
                    finish();

                }
            }
        };
        timerThread.start();
    }

    public void updateProgress(final int timePassed){
        if(null != progressBar){
            final int progress = progressBar.getMax() * timePassed / TIMER_RUNTIME;
            progressBar.setProgress(progress);
        }
    }
}
