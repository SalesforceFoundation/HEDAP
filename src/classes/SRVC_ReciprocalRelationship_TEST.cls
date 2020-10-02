/*
    Copyright (c) 2009, 2012, Salesforce.org
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Salesforce.org nor the names of
      its contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
    FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
    COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
    BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
    CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
    LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
    ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
    POSSIBILITY OF SUCH DAMAGE.
*/
/**
* @author Salesforce.org
* @date 2011,2012
* @group Relationships
* @group-content ../../ApexDocContent/Relationships.htm
* @description Test class for SRVC_ReciprocalRelationship.
*/
@isTest
private class SRVC_ReciprocalRelationship_TEST {
    /**************************************************************************************************************************
    * @description Test method for isRelationshipReciprocal() if false
    ***************************************************************************************************************************/
    @isTest
    private static void isRelationshipReciprocalFalseTest() {
        Contact contact1 = UTIL_UnitTestData_TEST.getContact();
        Contact contact2 = UTIL_UnitTestData_TEST.getContact();
        insert new List<Contact>{contact1, contact2};

        Relationship__c relationship = UTIL_UnitTestData_TEST.getRelationship(contact1.Id, null, 'Son');
        
        Set<Id> contactIds = new Set<Id>{contact1.Id, contact2.Id};
        
        Test.startTest();
            SRVC_ReciprocalRelationship instance = new SRVC_ReciprocalRelationship();
            Boolean isRelationshipReciprocal = instance.isRelationshipReciprocal(relationship, contactIds);
        Test.stopTest();
        
        System.assertEquals(false, isRelationshipReciprocal);
    }

    /**************************************************************************************************************************
    * @description Test method for isRelationshipReciprocal() if true
    ***************************************************************************************************************************/
    @isTest
    private static void isRelationshipReciprocalTrueTest() {
        Contact contact1 = UTIL_UnitTestData_TEST.getContact();
        Contact contact2 = UTIL_UnitTestData_TEST.getContact();
        insert new List<Contact>{contact1, contact2};

        Relationship__c relationship = UTIL_UnitTestData_TEST.getRelationship(contact1.Id, contact2.Id, 'Father');
        
        Set<Id> contactIds = new Set<Id>{contact1.Id, contact2.Id};
        
        Test.startTest();
            SRVC_ReciprocalRelationship instance = new SRVC_ReciprocalRelationship();
            Boolean isRelationshipReciprocal = instance.isRelationshipReciprocal(relationship, contactIds);
        Test.stopTest();
        
        System.assertEquals(true, isRelationshipReciprocal);
    }

    /**************************************************************************************************************************
    * @description Test method for shouldUpdateContactRelationships() if false
    ***************************************************************************************************************************/
    @isTest
    private static void shouldUpdateContactRelationshipsFalseTest() {
        Contact newContact = UTIL_UnitTestData_TEST.getContact();
        Contact oldContact = UTIL_UnitTestData_TEST.getContact();
        newContact.Gender__c = 'Male';
        oldContact.Gender__c = 'Male';
        Test.startTest();
            SRVC_ReciprocalRelationship instance = new SRVC_ReciprocalRelationship();
            Boolean shouldUpdateContactRelationships = instance.shouldUpdateContactRelationships(newContact, oldContact);
        Test.stopTest();
        
        System.assertEquals(false, shouldUpdateContactRelationships);
    }

    /**************************************************************************************************************************
    * @description Test method for shouldUpdateContactRelationships() if true
    ***************************************************************************************************************************/
    @isTest
    private static void shouldUpdateContactRelationshipsTrueTest() {
        Contact newContact = UTIL_UnitTestData_TEST.getContact();
        Contact oldContact = UTIL_UnitTestData_TEST.getContact();
        newContact.Gender__c = 'Male';
        oldContact.Gender__c = 'Female';
        Test.startTest();
            SRVC_ReciprocalRelationship instance = new SRVC_ReciprocalRelationship();
            Boolean shouldUpdateContactRelationships = instance.shouldUpdateContactRelationships(newContact, oldContact);
        Test.stopTest();
        
        System.assertEquals(true, shouldUpdateContactRelationships);
    }

    /**************************************************************************************************************************
    * @description Test method for getRelationshipsForContacts() if contacts exist
    ***************************************************************************************************************************/
    @isTest
    private static void getRelationshipsForContactsContactsExistTest() {
        Contact contact1 = UTIL_UnitTestData_TEST.getContact();
        Contact contact2 = UTIL_UnitTestData_TEST.getContact();
        insert new List<Contact>{contact1, contact2};

        Set<Id> contactIds = new Set<Id>{contact1.Id, contact2.Id};

        Test.startTest();
            SRVC_ReciprocalRelationship instance = new SRVC_ReciprocalRelationship();
            Map<Id, Relationship__c> relationshipsForContacts = instance.getRelationshipsForContacts(contactIds);
        Test.stopTest();
        
        System.assertEquals(2, relationshipsForContacts.size());
        System.assertEquals(contact1.Id, relationshipsForContacts.values()[0].Id);
        System.assertEquals(contact2.Id, relationshipsForContacts.values()[1].Id);
    }

    /**************************************************************************************************************************
    * @description Test method for getRelationshipsForContacts() if no contact
    ***************************************************************************************************************************/
    @isTest
    private static void getRelationshipsForContactsEmptySetTest() {
        Test.startTest();
            SRVC_ReciprocalRelationship instance = new SRVC_ReciprocalRelationship();
            Map<Id, Relationship__c> relationshipsForContacts = instance.getRelationshipsForContacts(new Set<Id>());
        Test.stopTest();
        
        System.assertEquals(0, relationshipsForContacts.keySet().size());

    }
}
