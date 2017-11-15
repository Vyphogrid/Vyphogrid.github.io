package edu.dlsu.mobapde.werewolf;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by ruby on 11/15/2017.
 */

public class CreateGameActivity extends AppCompatActivity {

    public static final String PLAYERKEY = "PlayerKey-";
    public static final String ROOMKEY = "RoomKey";
    private Button btCreateGame, btCancel;
    private EditText etCreate;
    private FirebaseAuth auth = FirebaseAuth.getInstance();
    private FirebaseUser user = auth.getCurrentUser();
    private FirebaseDatabase firebaseDatabase = FirebaseDatabase.getInstance();
    private DatabaseReference root = firebaseDatabase.getReference().getRoot();
    private DatabaseReference roomList = root.child("RoomList");
    private String temp_key;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_create_game);

        btCreateGame = (Button) findViewById(R.id.b_create_game);
        btCancel = (Button) findViewById(R.id.b_cancel);
        etCreate = (EditText) findViewById(R.id.et_create);

        btCreateGame.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //check if may name na nilagay
                if(etCreate.getText().length() != 0) {
                    //store the game name in firebase
                    Map<String,Object> map = new HashMap<String, Object>();
                    temp_key = roomList.push().getKey();
                    roomList.updateChildren(map);
                    map.put("RoomName", etCreate.getText().toString());
                    map.put("VoteTally", "");
                    map.put("PlayerList", "");
                    roomList.child(ROOMKEY + temp_key).updateChildren(map);
                    //to remove value eto lang pala firebase.child(id).removeValue();

                    //let player join his created game
                    DatabaseReference playerList =
                            roomList.child(ROOMKEY + temp_key).child("PlayerList");
                    map = new HashMap<String, Object>();
                    map.put("Email", user.getEmail());
                    map.put("Role", "");  //pag may enough players na tsaka magkakarole
                    map.put("Username", user.getDisplayName());
                    playerList.child(PLAYERKEY + user.getUid()).updateChildren(map);

                    // go to waiing page
                    Intent i = new Intent();
                    //instruct the intent
                    i.setClass(getBaseContext(), WaitingPlayersActivity.class);
                    startActivity(i);
                    finish();
                }else{
                    Toast.makeText(getBaseContext(),
                            "Please type a name",
                            Toast.LENGTH_SHORT).show();
                }
            }
        });

        btCancel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // go to login page
                Intent i = new Intent();
                //instruct the intent
                i.setClass(getBaseContext(), MainMenu.class);
                startActivity(i);
                finish();
            }
        });
    }
}
