package com.example.fern_computer.antidrugvolunteer;

import android.content.Intent;
import android.os.StrictMode;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

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

public class Calendardetail extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_calendardetail);
        // Permission StrictMode
        if (android.os.Build.VERSION.SDK_INT > 9) {
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);
        }

        showInfo();

       /* // btnBack
        final Button btnBack = (Button) findViewById(R.id.btnBack);
        // Perform action on click
        btnBack.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                Intent newActivity = new Intent(DetailActivity.this, MainActivity.class);
                startActivity(newActivity);

            }
        });
        */
    }

    public void showInfo()
    {
        // txtMemberID,txtMemberID,txtUsername,txtPassword,txtName,txtEmail,txtTel
        final TextView tMemberID = (TextView)findViewById(R.id.txtMemberID);
        final TextView tUsername = (TextView)findViewById(R.id.txtUsername);
        final TextView tPassword = (TextView)findViewById(R.id.txtPassword);
        final TextView tName = (TextView)findViewById(R.id.txtName);
        final TextView tEmail = (TextView)findViewById(R.id.txtEmail);
        final TextView tTel = (TextView)findViewById(R.id.txtTel);

        String url = "http://192.168.1.38/Anti%20Drug%20Webservice2/getMeetingByID.php";

        Intent intent= getIntent();

        final String MemberID = intent.getStringExtra("alertID");

        List<NameValuePair> params = new ArrayList<NameValuePair>();
        params.add(new BasicNameValuePair("sAlertID", MemberID));

/** Get result from Server (Return the JSON Code)
 082.
 *
 083.
 * {"MemberID":"2","Username":"adisorn","Password":"adisorn@2","Name":"Adisorn Bunsong","Tel":"021978032","Email":"adisorn@thaicreate.com"}
 084.
 */

        String resultServer  = getHttpPost(url,params);

        String strMemberID = "";
        String strUsername = "";
        String strPassword = "";
        String strName = "";
        String strEmail = "";
        String strTel = "";

        JSONObject c;

        try {
            c = new JSONObject(resultServer);
            strMemberID = c.getString("alertID");
            strUsername = c.getString("meetingDate");
            strPassword = c.getString("meetingTitle");
            strName = c.getString("meetingDetail");
            strEmail = c.getString("meetingSummary");
            strTel = c.getString("meetingByStaffID");

            if(!strMemberID.equals(""))
            {
                tMemberID.setText("ID : "+strMemberID);
                tUsername.setText("วันที่ : "+strUsername);
                tPassword.setText("เรื่อง : "+strPassword);
                tName.setText("รายละเอียด : "+strName);
                tEmail.setText("สรุป : "+strEmail);
                tTel.setText("StaffID : "+strTel);
            }
            else{
                tMemberID.setText("-");
                tUsername.setText("-");
                tPassword.setText("-");
                tName.setText("-");
                tEmail.setText("-");
                tTel.setText("-");

            }
        } catch (JSONException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
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
