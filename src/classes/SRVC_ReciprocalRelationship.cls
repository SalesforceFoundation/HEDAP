/*
    Copyright (c) 2020, Salesforce.org
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this List of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this List of conditions and the following disclaimer in the
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
* @date 2020
* @group 
* @group-content ../../ApexDocContent/
* @description Service class for REL_Relationships_Con_TDTM. 
*/
public virtual with sharing class SRVC_ReciprocalRelationship {
    /*********************************************
    * @description Instance for Singleton Pattern.
    **********************************************/
    @TestVisible
    private static SRVC_ReciprocalRelationship instance;

    /*********************************************************************
    * @description Empty constructor is not public for Singleton Pattern.
    **********************************************************************/
    protected SRVC_ReciprocalRelationship() {}

    /*****************************************************************************
    * @description Static method to get the current instance for Singleton pattern.
    * @return The instance of SRVC_RelAutoCreateSettingsMapper.
    ******************************************************************************/
    public static SRVC_RelAutoCreateSettingsMapper getInstance() {
        if (SRVC_ReciprocalRelationship.instance == null) {
            SRVC_ReciprocalRelationship.instance = new SRVC_ReciprocalRelationship();
        }

        return SRVC_ReciprocalRelationship.instance;
    }