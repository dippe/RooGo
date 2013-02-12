

// dummy data
entityArr = Array();
entityArr[0] = {
    name:"users",
    id: 1,
    projectId: 213,
    fields:
        [
            {
                id: 4,
                fieldName: 'userName',
                rooType: 'String',
                javaType: 'java.lang.String',
                switches: [
                    {
                        id:1,
                        fieldId: 4,
                        text: '--notNull'
                    },
                    {
                        id:2,
                        fieldId: 4,
                        text: '--sizeMin 2'
                    }
                ]
            },
            {
                id: 5,
                fieldName: 'password',
                rooType: 'String',
                javaType: 'java.lang.String',
                switches: [
                    {
                        id:3,
                        fieldId: 5,
                        switchName: '--unique',
                        switchValue: ''
                    },
                    {
                        id:4,
                        fieldId: 5,
                        switchName: '--sizeMax',
                        switchValue: '23'
                    }
                ]
            }
     ]
};
entityArr[1] = {
    name:"kocsi",
    id: 2,
    projectId: 213,
    fields:
        [
            {
                id: 2,
                fieldName: 'szin',
                rooType: 'String',
                javaType: 'java.lang.String',
                switches: [
                    {
                        id:1,
                        fieldId:2,
                        switchName: '--notNull',
                        switchValue: ''
                    },
                    {
                        id:2,
                        fieldId:2,
                        switchName: '--sizeMin',
                        switchValue: '2'
                    }
                ]
            },
            {
                id: 3,
                fieldName: 'kerek',
                rooType: 'String',
                javaType: 'java.lang.String',
                switches: [
                    {
                        id:13,
                        fieldId:3,
                        switchName: '--unique',
                        switchValue: ''
                    },
                    {
                        id:14,
                        fieldId:3,
                        switchName: '--sizeMin',
                        switchValue: '11'
                    }
                ]
            }
     ]
};

