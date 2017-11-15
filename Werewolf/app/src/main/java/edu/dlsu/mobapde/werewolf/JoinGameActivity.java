package edu.dlsu.mobapde.werewolf;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.ChildEventListener;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

import edu.dlsu.mobapde.werewolf.adapter.GameAdapter;
import edu.dlsu.mobapde.werewolf.entity.Game;

/**
 * Created by ruby on 11/15/2017.
 */

public class JoinGameActivity extends AppCompatActivity {
    RecyclerView btGameName;
    Button btCancel;

    public static final String PLAYERKEY = "PlayerKey-";
    private FirebaseAuth auth = FirebaseAuth.getInstance();
    private FirebaseUser user = auth.getCurrentUser();
    private DatabaseReference root =
            FirebaseDatabase.getInstance().getReference().getRoot();
    private DatabaseReference roomList =
            FirebaseDatabase.getInstance().getReference().getRoot().child("RoomList");
    private ArrayList<Game> games = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_join_game);

        btGameName = (RecyclerView) findViewById(R.id.b_game_name);
        btCancel = (Button) findViewById(R.id.b_cancel);

        final GameAdapter ga = new GameAdapter(games);
        ga.setOnItemClickListener(new GameAdapter.OnItemClickListener() {
            @Override
            public void onItemClick(Game g) {
                //let current player join room
                DatabaseReference playerList =
                        roomList.child(g.getKey()).child("PlayerList");
                Map<String,Object> map = new HashMap<String, Object>();
                map.put("Email", user.getEmail());
                map.put("Role", "");  //pag may enough players na tsaka magkakarole
                map.put("Username", user.getDisplayName());
                playerList.child(PLAYERKEY + user.getUid()).updateChildren(map);

                // go to waiting page
                Intent i = new Intent();
                //instruct the intent
                i.setClass(getBaseContext(), WaitingPlayersActivity.class);
                startActivity(i);
                finish();
                /*Toast.makeText(getBaseContext(),
                        "Clicked on " + g.getName(),
                        Toast.LENGTH_SHORT).show();*/
            }
            //TOAST FOR NOW!!!!
        });

        btGameName.setAdapter(ga);
        btGameName.setLayoutManager(new LinearLayoutManager(
                getBaseContext(), LinearLayoutManager.VERTICAL, false
        ));

        btCancel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // go to main page
                Intent i = new Intent();
                //instruct the intent
                i.setClass(getBaseContext(), MainMenu.class);
                startActivity(i);
                finish();
            }
        });

        //show all existing games
        roomList.addValueEventListener(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                games.clear();
                ga.setGames(appendGameList(dataSnapshot, roomList));
            }

            @Override
            public void onCancelled(DatabaseError databaseError) {

            }
        });
    }

    private String gameName, gameKey;
    public ArrayList<Game> appendGameList(DataSnapshot dataSnapshot, DatabaseReference roomList){
        Iterator i = dataSnapshot.getChildren().iterator();
        while(i.hasNext()){
            DataSnapshot temp = ((DataSnapshot)i.next());
            gameKey = temp.getKey();

            gameName = temp
                        .child("RoomName")
                        .getValue(String.class);
            games.add(new Game(gameName, gameKey));
        }
        return games;
    }
}
