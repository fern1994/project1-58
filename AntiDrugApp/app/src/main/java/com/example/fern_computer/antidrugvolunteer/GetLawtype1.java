package com.example.fern_computer.antidrugvolunteer;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.StrictMode;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.ImageView;
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

public class GetLawtype1 extends AppCompatActivity {
    @SuppressLint("NewApi")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_get_select);
        // Permission StrictMode
        if (android.os.Build.VERSION.SDK_INT > 9) {
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);
        }

        showInfo();

    }
    public void showInfo(){

        final TextView tLawID = (TextView)findViewById(R.id.txtID);
        final TextView tLawName = (TextView)findViewById(R.id.txtName);
        final TextView tLawDetail = (TextView)findViewById(R.id.txtDetail);
        ImageView image = (ImageView)findViewById(R.id.image);
        image.setImageResource(R.drawable.drugicon);


        String url = "http://192.168.1.38/Anti%20Drug%20Webservice2/getLawType1ByID.php";

        Intent intent= getIntent();

        final String LawID = intent.getStringExtra("lawID");

        List<NameValuePair> params = new ArrayList<NameValuePair>();
        params.add(new BasicNameValuePair("sLawID", LawID));

        String resultServer = getHttpPost(url,params);

        String strLawID = "";
        String strLawName = "";
        String strLawDetail = "";


        JSONObject c;

        try{
            c = new JSONObject(resultServer);
            strLawID = c.getString("lawID");
            strLawName = c.getString("lawName");
            strLawDetail = c.getString("lawDetail");


            if(!strLawID.equals("")){
                tLawID.setText(strLawID);
                tLawName.setText(strLawName);
                tLawDetail.setText(strLawDetail);

            }else{
                tLawID.setText("-");
                tLawName.setText("-");
                tLawDetail.setText("-");

            }
        }catch(JSONException e){
            e.printStackTrace();
        }
    }

    public String getHttpPost(String url,List<NameValuePair> params){
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
