package com.example.fern_computer.antidrugvolunteer;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;

public class EvaluateForm extends AppCompatActivity implements View.OnClickListener {
    EditText cardid,name,surname,age,address;
    RadioGroup rg1,rg2,rg3,rg4,rg5,rg6;
    RadioButton r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23,r24,r25,r26;
    int qs1,qs2,qs3,qs4,qs5,qs6;
    String seclectType;
    Button eval;
    int total;
    private String Result;
    private String CardID;
    private String Name;
    private String Surname;
    private String Age;
    private String Address;
    private String SelectType;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_evaluate_form);
        seclectType = getIntent().getStringExtra("type");


        setContentView(R.layout.activity_evaluate_form);
        cardid = (EditText)findViewById(R.id.etcardid);
        name = (EditText)findViewById(R.id.etname);
        surname = (EditText)findViewById(R.id.etsurname);
        age = (EditText)findViewById(R.id.etage);
        address = (EditText)findViewById(R.id.etaddr);

        rg1 = (RadioGroup)findViewById(R.id.radiogroup);
        rg2 = (RadioGroup)findViewById(R.id.radiogroup2);
        rg3 = (RadioGroup)findViewById(R.id.radiogroup3);
        rg4 = (RadioGroup)findViewById(R.id.radiogroup4);
        rg5 = (RadioGroup)findViewById(R.id.radiogroup5);
        rg6 = (RadioGroup)findViewById(R.id.radiogroup6);

        r1 = (RadioButton)findViewById(R.id.radioButton1);
        r2 = (RadioButton)findViewById(R.id.radioButton2);
        r3 = (RadioButton)findViewById(R.id.radioButton3);
        r4 = (RadioButton)findViewById(R.id.radioButton4);
        r5 = (RadioButton)findViewById(R.id.radioButton5);
        r6 = (RadioButton)findViewById(R.id.radioButton6);
        r7 = (RadioButton)findViewById(R.id.radioButton7);
        r8 = (RadioButton)findViewById(R.id.radioButton8);
        r9 = (RadioButton)findViewById(R.id.radioButton9);
        r10 = (RadioButton)findViewById(R.id.radioButton10);
        r11 = (RadioButton)findViewById(R.id.radioButton11);
        r12 = (RadioButton)findViewById(R.id.radioButton12);
        r13 = (RadioButton)findViewById(R.id.radioButton13);
        r14 = (RadioButton)findViewById(R.id.radioButton14);
        r15 = (RadioButton)findViewById(R.id.radioButton15);
        r16 = (RadioButton)findViewById(R.id.radioButton16);
        r17 = (RadioButton)findViewById(R.id.radioButton17);
        r18 = (RadioButton)findViewById(R.id.radioButton18);
        r19 = (RadioButton)findViewById(R.id.radioButton19);
        r20 = (RadioButton)findViewById(R.id.radioButton20);
        r21 = (RadioButton)findViewById(R.id.radioButton21);
        r22 = (RadioButton)findViewById(R.id.radioButton22);
        r23 = (RadioButton)findViewById(R.id.radioButton23);
        r24 = (RadioButton)findViewById(R.id.radioButton24);
        r25 = (RadioButton)findViewById(R.id.radioButton25);
        r26 = (RadioButton)findViewById(R.id.radioButton26);

        eval = (Button)findViewById(R.id.btnevaluate);

        r1.setOnClickListener(this);
        r2.setOnClickListener(this);
        r3.setOnClickListener(this);
        r4.setOnClickListener(this);
        r5.setOnClickListener(this);
        r6.setOnClickListener(this);
        r7.setOnClickListener(this);
        r8.setOnClickListener(this);
        r9.setOnClickListener(this);
        r10.setOnClickListener(this);
        r11.setOnClickListener(this);
        r12.setOnClickListener(this);
        r13.setOnClickListener(this);
        r14.setOnClickListener(this);
        r15.setOnClickListener(this);
        r16.setOnClickListener(this);
        r17.setOnClickListener(this);
        r18.setOnClickListener(this);
        r19.setOnClickListener(this);
        r20.setOnClickListener(this);
        r21.setOnClickListener(this);
        r22.setOnClickListener(this);
        r23.setOnClickListener(this);
        r24.setOnClickListener(this);
        r25.setOnClickListener(this);
        r26.setOnClickListener(this);
        eval.setOnClickListener(this);

    }

    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.radioButton1:
                qs1=0;
                break;
            case R.id.radioButton2:
                qs1=2;
                break;
            case R.id.radioButton3:
                qs1=3;
                break;
            case R.id.radioButton4:
                qs1=4;
                break;
            case R.id.radioButton5:
                qs1=6;
                break;
            case R.id.radioButton6:
                qs2=0;
                break;
            case R.id.radioButton7:
                qs2=3;
                break;
            case R.id.radioButton8:
                qs2=4;
                break;
            case R.id.radioButton9:
                qs2=5;
                break;
            case R.id.radioButton10:
                qs2=6;
                break;
            case R.id.radioButton11:
                qs3=0;
                break;
            case R.id.radioButton12:
                qs3=4;
                break;
            case R.id.radioButton13:
                qs3=5;
                break;
            case R.id.radioButton14:
                qs3=6;
                break;
            case R.id.radioButton15:
                qs3=7;
                break;
            case R.id.radioButton16:
                qs4=0;
                break;
            case R.id.radioButton17:
                qs4=5;
                break;
            case R.id.radioButton18:
                qs4=6;
                break;
            case R.id.radioButton19:
                qs4=7;
                break;
            case R.id.radioButton20:
                qs4=8;
                break;
            case R.id.radioButton21:
                qs5=0;
                break;
            case R.id.radioButton22:
                qs5=6;
                break;
            case R.id.radioButton23:
                qs5=3;
                break;
            case R.id.radioButton24:
                qs6=0;
                break;
            case R.id.radioButton25:
                qs6=6;
                break;
            case R.id.radioButton26:
                qs6=3;
                break;
            case R.id.btnevaluate:
                btnEvaluate();
                break;
        }
    }
    public void btnEvaluate(){
        total = qs1+qs2+qs3+qs4+qs5+qs6;
        Intent intent = new Intent(EvaluateForm.this,EvaluateResult.class);
        intent.putExtra("Result",total);
        intent.putExtra("CardID",cardid.getText().toString());
        intent.putExtra("Name",name.getText().toString());
        intent.putExtra("Surname",surname.getText().toString());
        intent.putExtra("Age",age.getText().toString());
        intent.putExtra("Address", address.getText().toString());
        intent.putExtra("SelectType",seclectType);
        startActivity(intent);
    }

    public String getResult() {
        return Result;
    }

    public void setResult(String result) {
        Result = result;
    }

    public String getCardID() {
        return CardID;
    }

    public void setCardID(String cardID) {
        CardID = cardID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getAge() {
        return Age;
    }

    public void setAge(String age) {
        Age = age;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getSelectType() {
        return SelectType;
    }

    public void setSelectType(String selectType) {
        SelectType = selectType;
    }

    public String getSurname() {
        return Surname;
    }

    public void setSurname(String surname) {
        Surname = surname;
    }
}
