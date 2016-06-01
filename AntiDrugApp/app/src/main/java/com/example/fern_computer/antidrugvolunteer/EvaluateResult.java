package com.example.fern_computer.antidrugvolunteer;

import android.annotation.SuppressLint;
import android.app.AlertDialog;
import android.content.Intent;
import android.os.StrictMode;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.StatusLine;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class EvaluateResult extends AppCompatActivity implements View.OnClickListener {
    TextView getname,getsurname,getscore,gettype,geteval,getaddress,getcardid,getage,date;
    EditText volunteernumber;
    String getName,getSurname,getType,getCardID,getAge,getAddress,Eval;
    int getScore;
    String score,Score;
    Button putresult,cancel;

    @SuppressLint("NewApi")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_evaluate_result);
        // Permission StrictMode
        if (android.os.Build.VERSION.SDK_INT > 9) {
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);
        }


        getname = (TextView)findViewById(R.id.txtname);
        getsurname = (TextView)findViewById(R.id.txtsurname);
        getscore = (TextView)findViewById(R.id.txtscore);
        geteval = (TextView)findViewById(R.id.txtevalresult);
        gettype = (TextView)findViewById(R.id.txttype);
        getaddress = (TextView)findViewById(R.id.txtaddress);
        getcardid = (TextView)findViewById(R.id.txtcardID);
        getage = (TextView)findViewById(R.id.txtage);

        date = (TextView)findViewById(R.id.txtdate);
        final Calendar c = Calendar.getInstance();
        int yy = c.get(Calendar.YEAR);
        int mm = c.get(Calendar.MONTH);
        int dd = c.get(Calendar.DAY_OF_MONTH);

        date.setText(new StringBuilder().append(yy).append("-").append(mm+1).append("-").append(dd));

        volunteernumber = (EditText)findViewById(R.id.etvolID);

        putresult = (Button)findViewById(R.id.btnputresult);
        cancel = (Button)findViewById(R.id.btncancel);

        putresult.setOnClickListener(this);
        cancel.setOnClickListener(this);


        getName = getIntent().getStringExtra("Name");
        getSurname = getIntent().getStringExtra("Surname");
        getScore = getIntent().getIntExtra("Result", 0);
        getType = getIntent().getStringExtra("SelectType");
        getCardID = getIntent().getStringExtra("CardID");
        getAge = getIntent().getStringExtra("Age");
        getAddress = getIntent().getStringExtra("Address");

        score = String.valueOf(getScore);


        getname.setText("ชื่อผู้ป่วย: "+getName);
        getsurname.setText("สกุล: "+getSurname);
        getscore.setText("คะแนน: "+score);
        gettype.setText("ประเภท: "+getType);
        getcardid.setText("CarsID: "+getCardID);
        getage.setText("อายุ: "+getAge);
        getaddress.setText("ทีอยู่: "+getAddress);

        if(0 <= getScore && getScore <= 3 ){
            geteval.setText("ความเสี่ยง: ต่ำ");
            Eval = "Low";
        }else if(4 <= getScore && getScore <= 26){
            geteval.setText("ความเสี่ยง: ปานกลาง");
            Eval = "Medium";
        }else if(getScore >= 27){
            geteval.setText("ความเสี่ยง: สูง");
            Eval = "High";
        }

    }

    public boolean SaveData()
    {

        // Dialog
        final AlertDialog.Builder ad = new AlertDialog.Builder(this);

        ad.setTitle("Error! ");
        ad.setIcon(android.R.drawable.btn_star_big_on);
        ad.setPositiveButton("Close", null);

        String url = "http://192.168.1.38/Anti%20Drug%20Webservice2/saveData.php";

        List<NameValuePair> params = new ArrayList<NameValuePair>();
        params.add(new BasicNameValuePair("sEvaluateID", ""));
        params.add(new BasicNameValuePair("sPatientIDCard", getCardID));
        params.add(new BasicNameValuePair("sPatientName", getName));
        params.add(new BasicNameValuePair("sPatientLastname", getSurname));
        params.add(new BasicNameValuePair("sPatientAge", getAge));
        params.add(new BasicNameValuePair("sPatientAddress", getAddress));
        params.add(new BasicNameValuePair("sEvaluatePoint", score));
        params.add(new BasicNameValuePair("sDrugType", getType));
        params.add(new BasicNameValuePair("sEvaluateResult", Eval));
        params.add(new BasicNameValuePair("sEvaluateDate", date.getText().toString()));
        params.add(new BasicNameValuePair("sEvaluateByStaffID", volunteernumber.getText().toString()));

        /** Get result from Server (Return the JSON Code)
         * StatusID = ? [0=Failed,1=Complete]
         * Error	= ?	[On case error return custom error message]
         *
         * Eg Save Failed = {"StatusID":"0","Error":"Email Exists!"}
         * Eg Save Complete = {"StatusID":"1","Error":""}
         */

        String resultServer  = getHttpPost(url,params);

        /*** Default Value ***/
        String strStatusID = "0";
        String strError = "Unknow Status!";

        JSONObject c;
        try {
            c = new JSONObject(resultServer);
            strStatusID = c.getString("StatusID");
            strError = c.getString("Error");
        } catch (JSONException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        // Prepare Save Data
        if(strStatusID.equals("0"))
        {
            ad.setMessage(strError);
            ad.show();
        }
        else
        {
            Toast.makeText(EvaluateResult.this, "Save Data Successfully", Toast.LENGTH_SHORT).show();

        }


        return true;
    }

    public String getHttpPost(String url,List<NameValuePair> params) {
        StringBuilder str = new StringBuilder();
        HttpClient client = new DefaultHttpClient();
        HttpPost httpPost = new HttpPost(url);

        try {
            httpPost.setEntity(new UrlEncodedFormEntity(params,"UTF-8"));
            HttpResponse response = client.execute(httpPost);
            StatusLine statusLine = response.getStatusLine();
            int statusCode = statusLine.getStatusCode();
            if (statusCode == 200) { // Status OK
                HttpEntity entity = response.getEntity();
                InputStream content = entity.getContent();
                BufferedReader reader = new BufferedReader(new InputStreamReader(content));
                String line;
                while ((line = reader.readLine()) != null) {
                    str.append(line);
                }
            } else {
                Log.e("Log", "Failed to download result..");
            }
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return str.toString();
    }

    @Override
    public void onClick(View v) {
        switch(v.getId()){
            case R.id.btnputresult:
                if (SaveData()) {
                    // When Save Complete
                }
                break;
            case R.id.btncancel:
                Intent i2 = new Intent(EvaluateResult.this,Evaluate.class);
                startActivity(i2);
                break;
        }
    }
}
