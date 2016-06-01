package com.example.fern_computer.antidrugvolunteer;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class Law extends AppCompatActivity implements View.OnClickListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_law);

        Button type1 = (Button)findViewById(R.id.type1);
        Button type2 = (Button)findViewById(R.id.type2);
        Button type3 = (Button)findViewById(R.id.type3);
        Button type4 = (Button)findViewById(R.id.type4);
        Button type5 = (Button)findViewById(R.id.type5);

        type1.setOnClickListener(this);
        type2.setOnClickListener(this);
        type3.setOnClickListener(this);
        type4.setOnClickListener(this);
        type5.setOnClickListener(this);

    }

    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.type1 :
                Intent i = new Intent(Law.this,Lawtype1.class);
                startActivity(i);
                break;
            case R.id.type2 :
                Intent i2 = new Intent(Law.this,Lawtype2.class);
                startActivity(i2);
                break;
            case R.id.type3 :
                Intent i3 = new Intent(Law.this,Lawtype3.class);
                startActivity(i3);
                break;
            case R.id.type4 :
                Intent i4 = new Intent(Law.this,Lawtype4.class);
                startActivity(i4);
                break;
            case R.id.type5 :
                Intent i5 = new Intent(Law.this,Lawtype5.class);
                startActivity(i5);
                break;
        }
    }
}
