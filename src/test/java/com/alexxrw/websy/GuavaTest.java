package com.alexxrw.websy;

import com.google.common.base.Joiner;
import com.google.common.base.Splitter;
import com.google.common.base.Strings;
import com.google.common.collect.*;
import org.assertj.core.util.Lists;
import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

import static com.google.common.collect.Lists.*;
import static com.google.common.collect.Sets.*;

public class GuavaTest {

    public static void print(Object ... args){
        Arrays.stream(args).forEach(System.out::println);
    }

    @Test
    public void testA() {
        ArrayList<String> list = new ArrayList<>();

        list.add("first");
        list.add("second");
        list.add("third");

        ArrayList<String> list1 = new ArrayList<String>() {{
            add("first");
            add("second");
            add("third");
        }};

        List<String> list2 = ImmutableList.of("first", "second", "third");

        ImmutableList.Builder<Object> builder = ImmutableList.builder();
        for (int i = 0; i < 100; i++) {
            builder.add(i);
        }

        list.addAll(list2);

        ImmutableMap<String, Integer> map = ImmutableMap.of("first", 1, "second", 2, "third", 3);

        print(list);
        print(list1);
        print(list2);
        print(map);
    }

    @Test
    public void testB(){
        print(Strings.commonSuffix("Mike", "Coke"));
        print(Strings.commonPrefix("Mike", "Coke"));

        print(Strings.padEnd("some long string", 20,'_'));
        print(Strings.repeat("_", 20));

        ImmutableList.of("John", "Jeremy", "Mike", "Sudharsan")
                .stream()
                .map(name -> Strings.padStart(name, 15,'.'))
                .forEach(GuavaTest::print);
    }

    @Test
    public void testC(){
        String str = "long text, just long text, nothing but text";

        Iterable<String> strings = Splitter.on("text").split(str);

        print(strings);

        String result = Joiner.on("video").join(strings);

        print(result);

    }

    @Test
    public void testD() {
        ArrayList<String> list = Lists.newArrayList("First", "Second", "Third");

        HashSet<String> hashSet = newHashSet("fourth", "fifth", "sixth");

        Iterable<String> concat = Iterables.concat(list, hashSet);

        Iterable<String> skip = Iterables.skip(concat, 2);
        Iterable<String> limit = Iterables.limit(skip, 2);

        print(concat);

        print(concat, limit);
    }

    @Test
    public void testE() {
        HashSet<Integer> set = Sets.newHashSet(1, 2, 3, 4);
        HashSet<Integer> set2 = Sets.newHashSet(3, 4, 5, 6, 7);

        SetView<Integer> diff1 = Sets.difference(set, set2);
        SetView<Integer> diff2 = Sets.difference(set2, set);

        SetView<Integer> intersection = Sets.intersection(set, set2);

        print(diff1, diff2, intersection);
    }

    @Test
    public void testF() {
        HashMultiset<String> multiset = HashMultiset.create();

        multiset.add("Websy");
        multiset.add("Yoyoy oyoyo", 3);
        multiset.add("A");
        multiset.add("A");

        print(multiset);
    }

    @Test
    public void testG() {
        HashMultimap<String, String> multimap = HashMultimap.create();

        multimap.put("Websy", "Alex");
        multimap.put("A", "Gromov");
        multimap.put("A", "Killa");
        multimap.putAll("Google", newArrayList("Page", "Bring"));

        print(multimap);
    }

    @Test
    public void testH() {
        HashBiMap<String, Integer> biMap = HashBiMap.create();

        biMap.put("Alex", 1);
        biMap.put("Google", 2);
        biMap.put("YOYO", 3);

        print(biMap);
        print(biMap.get("Google"), biMap.inverse().get(2));
    }

    @Test
    public void testI() {

        HashBasedTable<String, String, Double> table = HashBasedTable.create();

        table.put("Mike", "2017-11-15", 2000.0);
        table.put("Mike", "2018-09-15", 1000.0);
        table.put("Alexx", "2017-11-24", 3000.0);
        table.put("Alexx", "2016-11-02", 6500.0);
        table.put("Bashirov", "2017-12-05", 750.0);
        table.put("Bashirov", "2019-11-02", 3200.0);

        print(
                table,
                table.get("Mike", "2017-11-15"),
                table.row("Mike"),
                table.column("2017-12-05"),
                Tables.transpose(table)
        );
    }
}
