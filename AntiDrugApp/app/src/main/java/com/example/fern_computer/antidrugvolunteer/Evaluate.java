package com.example.fern_computer.antidrugvolunteer;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class Evaluate extends AppCompatActivity {
    private String type;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_evaluate);
        String[] str = { "ผลิตภัณฑ์ยาสูบ", "กัญชา", "ใบกระท่อม","สารผสมน้ำต้มใบกระท่อม","ยาบ้าและยากลุ่มกระต้นประสาท","สารระเหย","ฝิ่น เฮโรอีน","ยานอนหลับ","โคเคน" };

        ListView listView1 = (ListView)findViewById(R.id.listView);
        listView1.setAdapter(new ArrayAdapter(this, android.R.layout.simple_list_item_1, str));
        listView1.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            public void onItemClick(AdapterView<?> arg0, View arg1, int arg2,
                                    long arg3) {
                Intent intent;
                switch (arg2) {
                    case 0:
                        intent = new Intent(getApplicationContext(), EvaluateForm.class);
                        intent.putExtra("type", "ผลิตภัณฑ์ยาสูบ");
                        startActivity(intent);
                        break;
                    case 1:
                        intent = new Intent(getApplicationContext(), EvaluateForm.class);
                        intent.putExtra("type", "กัญชา");
                        startActivity(intent);
                        break;
                    case 2:
                        intent = new Intent(getApplicationContext(), EvaluateForm.class);
                        intent.putExtra("type", "ใบกระท่อม");
                        startActivity(intent);
                        break;
                    case 3:
                        intent = new Intent(getApplicationContext(), EvaluateForm.class);
                        intent.putExtra("type", "สารผสมน้ำต้มใบกระท่อม");
                        startActivity(intent);
                        break;
                    case 4:
                        intent = new Intent(getApplicationContext(), EvaluateForm.class);
                        intent.putExtra("type", "ยาบ้าและยากลุ่มกระต้นประสาท");
                        startActivity(intent);
                        break;
                    case 5:
                        intent = new Intent(getApplicationContext(), EvaluateForm.class);
                        intent.putExtra("type", "สารระเหย");
                        startActivity(intent);
                        break;
                    case 6:
                        intent = new Intent(getApplicationContext(), EvaluateForm.class);
                        intent.putExtra("type", "ฝิ่น เฮโรอีน");
                        startActivity(intent);
                        break;
                    case 7:
                        intent = new Intent(getApplicationContext(), EvaluateForm.class);
                        intent.putExtra("type", "ยานอนหลับ");
                        startActivity(intent);
                        break;
                    case 8:
                        intent = new Intent(getApplicationContext(), EvaluateForm.class);
                        intent.putExtra("type", "โคเคน");
                        startActivity(intent);
                        break;
                }
            }
        });
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void onBackPressed() {
        AlertDialog.Builder dialog = new AlertDialog.Builder(this);
        dialog.setTitle("ออก");
        dialog.setCancelable(true);
        dialog.setMessage("คุณต้องการออกหรือไม่?");
        dialog.setPositiveButton("ใช่", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int which) {
                Intent intent = new Intent(Evaluate.this,Main.class);
                startActivity(intent);

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
