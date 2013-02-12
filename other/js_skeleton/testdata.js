

// dummy data
entityArr = Array();
entityArr[0] = {
    name:"users",
    id: 1,
    fields:
        [
            {
                fieldName: 'userName',
                rooType: 'String',
                javaType: 'java.lang.String',
                switches: [
                    {
                        id:1,
                        text: '--notNull'
                    },
                    {
                        id:2,
                        text: '--sizeMin 2'
                    }
                ]
            },
            {
                fieldName: 'password',
                rooType: 'String',
                javaType: 'java.lang.String',
                switches: [
                    {
                        id:3,
                        switchName: '--unique',
                        switchValue: ''
                    },
                    {
                        id:4,
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
    fields:
        [
            {
                fieldName: 'szin',
                rooType: 'String',
                javaType: 'java.lang.String',
                switches: [
                    {
                        id:1,
                        switchName: '--notNull',
                        switchValue: ''
                    },
                    {
                        id:2,
                        switchName: '--sizeMin',
                        switchValue: '2'
                    }
                ]
            },
            {
                fieldName: 'kerek',
                rooType: 'String',
                javaType: 'java.lang.String',
                switches: [
                    {
                        id:3,
                        switchName: '--unique',
                        switchValue: ''
                    },
                    {
                        id:4,
                        switchName: '--sizeMin',
                        switchValue: '123'
                    }
                ]
            }
     ]
};

