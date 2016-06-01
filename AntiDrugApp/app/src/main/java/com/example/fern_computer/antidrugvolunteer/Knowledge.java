package com.example.fern_computer.antidrugvolunteer;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class Knowledge extends AppCompatActivity implements View.OnClickListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_knowledge);
        Button drug = (Button)findViewById(R.id.drug);
        Button raw = (Button)findViewById(R.id.raw);
        Button addict = (Button)findViewById(R.id.addict);

        drug.setOnClickListener(this);
        raw.setOnClickListener(this);
        addict.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.drug
                    :Intent i = new Intent(Knowledge.this,Drug.class);
                startActivity(i);
                break;
            case R.id.raw
                    :Intent i2 = new Intent(Knowledge.this,Law.class);
                startActivity(i2);
                break;
            case R.id.addict
                    :Intent i3 = new Intent(Knowledge.this,AddictPhase.class);
                startActivity(i3);
                break;

        }
    }
}
