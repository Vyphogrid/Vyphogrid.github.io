package edu.dlsu.mobapde.werewolf.entity;

/**
 * Created by ruby on 11/14/2017.
 */

public class Player {

    private String name;

    public Player(){

    }

    public Player(String name){
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
