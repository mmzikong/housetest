package com.base.housetest.model;

import javax.persistence.*;

@Entity
public class Epidemic {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;
    private String riskRegion;        //风险地


    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
        Id = id;
    }

    public String getRiskRegion() {
        return riskRegion;
    }

    public void setRiskRegion(String riskRegion) {
        this.riskRegion = riskRegion;
    }

    @Override
    public String toString() {
        return "Epidemic{" +
                "Id=" + Id +
                ", riskRegion='" + riskRegion + '\'' +
                '}';
    }
}
