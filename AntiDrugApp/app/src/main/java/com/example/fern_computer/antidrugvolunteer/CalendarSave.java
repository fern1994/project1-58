package com.example.fern_computer.antidrugvolunteer;

import android.annotation.SuppressLint;
import android.app.AlertDialog;
import android.os.StrictMode;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
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
import java.util.List;

public class CalendarSave extends AppCompatActivity {
    @SuppressLint("NewApi")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_calendar_save);
        // Permission StrictMode
        if (android.os.Build.VERSION.SDK_INT > 9) {
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);
        }

        // btnSave
        final Button btnSave = (Button) findViewById(R.id.btnSave);
        // Perform action on click
        btnSave.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                if (SaveData()) {
                    // When Save Complete
                }
            }
        });

    }

    public void onStart(){
        super.onStart();
        EditText txtDate = (EditText)findViewById(R.id.etUsername);
        txtDate.setOnFocusChangeListener(new View.OnFocusChangeListener() {
            @Override
            public void onFocusChange(View v, boolean hasFocus) {
                if (hasFocus) {
                    DateDialog dialog = new DateDialog(v);
                    android.support.v4.app.FragmentTransaction ft = getSupportFragmentManager().beginTransaction();
                    dialog.show(ft, "DatePicker");
                }
            }
        });
    }

    public boolean SaveData()
    {

        // txtUsername,txtPassword,txtName,txtEmail,txtTel
        final EditText txtUsername = (EditText)findViewById(R.id.etUsername);
        final EditText txtPassword = (EditText)findViewById(R.id.etPassword);
        final EditText txtName = (EditText)findViewById(R.id.etName);
        final EditText txtEmail = (EditText)findViewById(R.id.etEmail);
        final EditText txtTel = (EditText)findViewById(R.id.etTel);


        // Dialog
        final AlertDialog.Builder ad = new AlertDialog.Builder(this);

        ad.setTitle("Error! ");
        ad.setIcon(android.R.drawable.btn_star_big_on);
        ad.setPositiveButton("Close", null);

        // Check Username
        if(txtUsername.getText().length() == 0)
        {
            ad.setMessage("Please input [Date] ");
            ad.show();
            txtUsername.requestFocus();
            return false;
        }
        // Check Password
        if(txtPassword.getText().length() == 0)
        {
            ad.setMessage("Please input [Title] ");
            ad.show();
            txtPassword.requestFocus();
            return false;
        }
        /* Check Password and Confirm Password (Match)
        if(!txtPassword.getText().toString().equals(txtConPassword.getText().toString()))
        {
            ad.setMessage("Password and Confirm Password Not Match! ");
            ad.show();
            txtConPassword.requestFocus();
            return false;
        }*/
        // Check Name
        if(txtName.getText().length() == 0)
        {
            ad.setMessage("Please input [Detail] ");
            ad.show();
            txtName.requestFocus();
            return false;
        }
        // Check Email
        if(txtEmail.getText().length() == 0)
        {
            ad.setMessage("Please input [Summary] ");
            ad.show();
            txtEmail.requestFocus();
            return false;
        }
        // Check Tel
        if(txtTel.getText().length() == 0)
        {
            ad.setMessage("Please input [StaffID] ");
            ad.show();
            txtTel.requestFocus();
            return false;
        }


        String url = "http://192.168.1.38/Anti%20Drug%20Webservice2/saveMeeting.php";

        List<NameValuePair> params = new ArrayList<NameValuePair>();
        params.add(new BasicNameValuePair("salertID", ""));
        params.add(new BasicNameValuePair("smeetingDate", txtUsername.getText().toString()));
        params.add(new BasicNameValuePair("smeetingTitle", txtPassword.getText().toString()));
        params.add(new BasicNameValuePair("smeetingDetail", txtName.getText().toString()));
        params.add(new BasicNameValuePair("smeetingSummary", txtEmail.getText().toString()));
        params.add(new BasicNameValuePair("smeetingByStaffID", txtTel.getText().toString()));

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
            Toast.makeText(CalendarSave.this, "Save Data Successfully", Toast.LENGTH_SHORT).show();
            txtUsername.setText("");
            txtPassword.setText("");
            txtName.setText("");
            txtEmail.setText("");
            txtTel.setText("");
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
}
