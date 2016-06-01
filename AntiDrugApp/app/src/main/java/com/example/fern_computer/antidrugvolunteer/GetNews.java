package com.example.fern_computer.antidrugvolunteer;

import android.annotation.SuppressLint;
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

public class GetNews extends AppCompatActivity {
    @SuppressLint("NewApi")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_get_news);
        // Permission StrictMode
        if (android.os.Build.VERSION.SDK_INT > 9) {
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);
        }

        showInfo();


    }
    public void showInfo(){

        final TextView tNewsID = (TextView)findViewById(R.id.txtID);
        final TextView tTitle = (TextView)findViewById(R.id.txtName);
        final TextView tDetail = (TextView)findViewById(R.id.txtDetail);
        final TextView tDate = (TextView)findViewById(R.id.txtDate);

        String url = "http://192.168.1.38/Anti%20Drug%20Webservice2/getNewsByID2.php";

        Intent intent= getIntent();

        final String NewsID = intent.getStringExtra("newsID");

        List<NameValuePair> params = new ArrayList<NameValuePair>();
        params.add(new BasicNameValuePair("sNewsID", NewsID));

        String resultServer = getHttpPost(url,params);

        String strNewsID = "";
        String strTitle = "";
        String strDetail = "";
        String strDate = "";

        JSONObject c;

        try{
            c = new JSONObject(resultServer);
            strNewsID = c.getString("newsID");
            strTitle = c.getString("newsTitile");
            strDetail = c.getString("newsDetails");
            strDate = c.getString("newsDate");

            if(!strNewsID.equals("")){
                tNewsID.setText(strNewsID);
                tTitle.setText(strTitle);
                tDetail.setText(strDetail);
                tDate.setText(strDate);
            }else{
                tNewsID.setText("-");
                tTitle.setText("-");
                tDetail.setText("-");
                tDate.setText("-");
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
