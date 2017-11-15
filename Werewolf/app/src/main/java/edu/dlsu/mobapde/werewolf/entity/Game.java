package edu.dlsu.mobapde.werewolf.entity;

/**
 * Created by ruby on 11/14/2017.
 */

public class Game {

    private String name;
    private String key;

    public Game(String name, String key){
        this.name = name;
        this.key = key;
    }

    public Game(String name){
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }
}
