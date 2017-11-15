package edu.dlsu.mobapde.werewolf;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

/**
 * Created by ruby on 11/15/2017.
 */

public class RoleActivity extends AppCompatActivity {
    private Button btOkay;

    private FirebaseAuth auth;
    private DatabaseReference roomList =
            FirebaseDatabase.getInstance().getReference().getRoot().child("RoomList");

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_your_role);

        btOkay = (Button) findViewById(R.id.b_okay);

        auth = FirebaseAuth.getInstance();

        btOkay.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // go to create page
                Intent i = new Intent();
                //instruct the intent
                i.setClass(getBaseContext(), ChatActivity.class);
                // GO TO CHAT!!!!!
                startActivity(i);
            }
        });
    }
}
