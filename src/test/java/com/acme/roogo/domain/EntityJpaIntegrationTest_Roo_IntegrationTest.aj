// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.acme.roogo.domain;

import com.acme.roogo.domain.EntityJpa;
import com.acme.roogo.domain.EntityJpaDataOnDemand;
import com.acme.roogo.domain.EntityJpaIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect EntityJpaIntegrationTest_Roo_IntegrationTest {
    
    declare @type: EntityJpaIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: EntityJpaIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: EntityJpaIntegrationTest: @Transactional;
    
    @Autowired
    private EntityJpaDataOnDemand EntityJpaIntegrationTest.dod;
    
    @Test
    public void EntityJpaIntegrationTest.testCountEntityJpas() {
        Assert.assertNotNull("Data on demand for 'EntityJpa' failed to initialize correctly", dod.getRandomEntityJpa());
        long count = EntityJpa.countEntityJpas();
        Assert.assertTrue("Counter for 'EntityJpa' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void EntityJpaIntegrationTest.testFindEntityJpa() {
        EntityJpa obj = dod.getRandomEntityJpa();
        Assert.assertNotNull("Data on demand for 'EntityJpa' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'EntityJpa' failed to provide an identifier", id);
        obj = EntityJpa.findEntityJpa(id);
        Assert.assertNotNull("Find method for 'EntityJpa' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'EntityJpa' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void EntityJpaIntegrationTest.testFindAllEntityJpas() {
        Assert.assertNotNull("Data on demand for 'EntityJpa' failed to initialize correctly", dod.getRandomEntityJpa());
        long count = EntityJpa.countEntityJpas();
        Assert.assertTrue("Too expensive to perform a find all test for 'EntityJpa', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<EntityJpa> result = EntityJpa.findAllEntityJpas();
        Assert.assertNotNull("Find all method for 'EntityJpa' illegally returned null", result);
        Assert.assertTrue("Find all method for 'EntityJpa' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void EntityJpaIntegrationTest.testFindEntityJpaEntries() {
        Assert.assertNotNull("Data on demand for 'EntityJpa' failed to initialize correctly", dod.getRandomEntityJpa());
        long count = EntityJpa.countEntityJpas();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<EntityJpa> result = EntityJpa.findEntityJpaEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'EntityJpa' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'EntityJpa' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void EntityJpaIntegrationTest.testFlush() {
        EntityJpa obj = dod.getRandomEntityJpa();
        Assert.assertNotNull("Data on demand for 'EntityJpa' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'EntityJpa' failed to provide an identifier", id);
        obj = EntityJpa.findEntityJpa(id);
        Assert.assertNotNull("Find method for 'EntityJpa' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyEntityJpa(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'EntityJpa' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void EntityJpaIntegrationTest.testMergeUpdate() {
        EntityJpa obj = dod.getRandomEntityJpa();
        Assert.assertNotNull("Data on demand for 'EntityJpa' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'EntityJpa' failed to provide an identifier", id);
        obj = EntityJpa.findEntityJpa(id);
        boolean modified =  dod.modifyEntityJpa(obj);
        Integer currentVersion = obj.getVersion();
        EntityJpa merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'EntityJpa' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void EntityJpaIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'EntityJpa' failed to initialize correctly", dod.getRandomEntityJpa());
        EntityJpa obj = dod.getNewTransientEntityJpa(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'EntityJpa' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'EntityJpa' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'EntityJpa' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void EntityJpaIntegrationTest.testRemove() {
        EntityJpa obj = dod.getRandomEntityJpa();
        Assert.assertNotNull("Data on demand for 'EntityJpa' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'EntityJpa' failed to provide an identifier", id);
        obj = EntityJpa.findEntityJpa(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'EntityJpa' with identifier '" + id + "'", EntityJpa.findEntityJpa(id));
    }
    
}
