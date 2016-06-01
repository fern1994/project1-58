package com.example.fern_computer.antidrugvolunteer;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class CalendarMain extends AppCompatActivity implements View.OnClickListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_calendar_main);

        Button show = (Button)findViewById(R.id.show);
        Button save = (Button)findViewById(R.id.save);

        show.setOnClickListener(this);
        save.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.show :
                Intent i = new Intent(CalendarMain.this,Calendarview.class);
                startActivity(i);
                break;
            case R.id.save :
                Intent i2 = new Intent(CalendarMain.this,CalendarSave.class);
                startActivity(i2);
                break;

        }
    }
}
