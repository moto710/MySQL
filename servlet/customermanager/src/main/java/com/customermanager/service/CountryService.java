package com.customermanager.service;

import com.customermanager.model.Country;

import java.util.ArrayList;
import java.util.List;

public class CountryService implements IService<Country> {
    private List<Country> countryList = new ArrayList<>();

    public CountryService() {
//        countryList = new ArrayList<>();
        countryList.add(new Country(1, "VN"));
        countryList.add(new Country(2, "JP"));
        countryList.add(new Country(3, "UK"));
        countryList.add(new Country(4, "US"));
        countryList.add(new Country(5, "CA"));
    }

    public int getCountryId(String name) {
        for (Country country : countryList) {
            if (name.equalsIgnoreCase(country.getName()))
                return country.getId();
        }
        return -1;
    }

    @Override
    public List<Country> getAll() {
        return countryList;
    }

    @Override
    public void add(Country country) {
        countryList.add(country);
    }

    @Override
    public Country findById(int id) {
        for (Country country : countryList) {
            if (country.getId() == id) {
                return country;
            }
        }
        return null;
    }

    @Override
    public void update(Country country) {
        for (Country c : countryList) {
            if (c.getId() == country.getId()) {
                c.setName(country.getName());
            }
        }
    }

    @Override
    public void delete(int id) {
        countryList.remove(findById(id));
    }

    @Override
    public void delete(Country country) {
        countryList.remove(country);
    }
}
