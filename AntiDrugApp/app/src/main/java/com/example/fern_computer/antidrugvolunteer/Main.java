package com.example.fern_computer.antidrugvolunteer;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class Main extends AppCompatActivity implements View.OnClickListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Button knowlede = (Button)findViewById(R.id.knowlegde);
        Button news = (Button)findViewById(R.id.news);
        Button screening = (Button)findViewById(R.id.screening);
        Button logout = (Button)findViewById(R.id.logout);
        Button calendar = (Button)findViewById(R.id.calendar);

        knowlede.setOnClickListener(this);
        news.setOnClickListener(this);
        screening.setOnClickListener(this);
        logout.setOnClickListener(this);
        calendar.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.knowlegde
                    :Intent i = new Intent(Main.this,Knowledge.class);
                startActivity(i);
                break;
            case R.id.news
                    :Intent i2 = new Intent(Main.this,News.class);
                startActivity(i2);
                break;
            case R.id.screening
                    :Intent i3 = new Intent(Main.this,Evaluate.class);
                startActivity(i3);
                break;
            case R.id.calendar
                    :Intent i4 = new Intent(Main.this,CalendarMain.class);
                startActivity(i4);
                break;
            case R.id.logout
                    :onBackPressed();
                break;
        }
    }

    public void onBackPressed() {
        AlertDialog.Builder dialog = new AlertDialog.Builder(this);
        dialog.setTitle("ออก");
        dialog.setCancelable(true);
        dialog.setMessage("คุณต้องการออกหรือไม่?");
        dialog.setPositiveButton("ใช่", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int which) {
                Intent intent = new Intent(Intent.ACTION_MAIN);
                intent.addCategory(Intent.CATEGORY_HOME);
                intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(intent);
                finish();
                System.exit(0);


            }
        });

        dialog.setNegativeButton("ไม่", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int which) {
                dialog.cancel();

            }
        });

        dialog.show();
    }
}
