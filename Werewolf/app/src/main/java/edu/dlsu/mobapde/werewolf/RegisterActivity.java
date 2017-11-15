package edu.dlsu.mobapde.werewolf;

import android.app.ProgressDialog;
import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.auth.UserProfileChangeRequest;

public class RegisterActivity extends AppCompatActivity {

    private EditText etEmail;
    private EditText etPassword;
    private EditText etUsername;
    private TextView tvLogin;
    private Button btRegister;

    private String email, password, username;

    private ProgressDialog registerProgress;
    private FirebaseAuth auth;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);

        etEmail = (EditText) findViewById(R.id.email);
        etPassword = (EditText) findViewById(R.id.password);
        etUsername = (EditText) findViewById(R.id.username);
        tvLogin = (TextView) findViewById(R.id.login);
        btRegister = (Button) findViewById(R.id.register);
        registerProgress = new ProgressDialog(this);
        auth = FirebaseAuth.getInstance();

        tvLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // go to login page
                Intent i = new Intent();
                //instruct the intent
                i.setClass(getBaseContext(), LoginActivity.class);
                startActivity(i);
                finish();
            }
        });

        btRegister.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                email = etEmail.getText().toString();
                password = etPassword.getText().toString();
                username = etUsername.getText().toString();

                if(!TextUtils.isEmpty(username) || !TextUtils.isEmpty(email) || !TextUtils.isEmpty(password)) {
                    registerProgress.setTitle("Registering User");
                    registerProgress.setMessage("Please wait");
                    registerProgress.setCanceledOnTouchOutside(false);
                    registerProgress.show();
                    registerUser();
                }
            }
        });
    }

    public void registerUser() {
        auth.createUserWithEmailAndPassword(email, password).addOnCompleteListener(new OnCompleteListener<AuthResult>() {
            @Override
            public void onComplete(@NonNull Task<AuthResult> task) {
                if(task.isSuccessful()) {
                    FirebaseUser user = auth.getCurrentUser();
                    UserProfileChangeRequest profileUpdates =
                            new UserProfileChangeRequest.Builder().setDisplayName(username).build();
                    user.updateProfile(profileUpdates);
                    Log.d("BOI", "Username was " + username);
                    registerProgress.dismiss();
                    workaround();
                } else {
                    registerProgress.hide();
                    Toast.makeText(RegisterActivity.this, "You got some error", Toast.LENGTH_LONG).show();
                }
            }
        });
    }

    private void workaround(){
        FirebaseAuth.getInstance().signOut();
        registerProgress.setTitle("Logging In");
        registerProgress.setMessage("Please wait");
        registerProgress.setCanceledOnTouchOutside(false);
        registerProgress.show();
        loginUser(email, password);
    }

    private void loginUser(String email, String password) {
        auth.signInWithEmailAndPassword(email, password).addOnCompleteListener(new OnCompleteListener<AuthResult>() {
            @Override
            public void onComplete(@NonNull Task<AuthResult> task) {
                if(task.isSuccessful()) {
                    registerProgress.dismiss();
                    // go to main page
                    Intent i = new Intent();
                    //instruct the intent
                    i.setClass(getBaseContext(), MainMenu.class);
                    startActivity(i);
                    finish();
                } else {
                    registerProgress.hide();
                }
            }
        });
    }
}
