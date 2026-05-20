| subscriber billing |

"Simulating data load from database"
subscriber := Subscriber name: 'Maria Agustina' basicMonthlyFee: 10.00.

"Local calls"
subscriber addCall: (Call
    from: (PhoneNumber number: '1134567890' locality: 'Buenos Aires' country: 'Argentina')
    to: (PhoneNumber number: '1187654321' locality: 'Buenos Aires' country: 'Argentina')
    startTime: (DateAndTime year: 2024 month: 1 day: 15 hour: 10 minute: 0 second: 0)
    endTime: (DateAndTime year: 2024 month: 1 day: 15 hour: 10 minute: 10 second: 0)).

subscriber addCall: (Call
    from: (PhoneNumber number: '1134567890' locality: 'Buenos Aires' country: 'Argentina')
    to: (PhoneNumber number: '1187654321' locality: 'Buenos Aires' country: 'Argentina')
    startTime: (DateAndTime year: 2024 month: 1 day: 20 hour: 10 minute: 0 second: 0)
    endTime: (DateAndTime year: 2024 month: 1 day: 20 hour: 10 minute: 10 second: 0)).

"National call"
subscriber addCall: (Call
    from: (PhoneNumber number: '1134567890' locality: 'Buenos Aires' country: 'Argentina')
    to: (PhoneNumber number: '3514567890' locality: 'Cordoba' country: 'Argentina')
    startTime: (DateAndTime year: 2024 month: 1 day: 15 hour: 10 minute: 0 second: 0)
    endTime: (DateAndTime year: 2024 month: 1 day: 15 hour: 10 minute: 10 second: 0)).

"International call"
subscriber addCall: (Call
    from: (PhoneNumber number: '1134567890' locality: 'Buenos Aires' country: 'Argentina')
    to: (PhoneNumber number: '5511987654' locality: 'Sao Paulo' country: 'Brasil')
    startTime: (DateAndTime year: 2024 month: 1 day: 15 hour: 10 minute: 0 second: 0)
    endTime: (DateAndTime year: 2024 month: 1 day: 15 hour: 10 minute: 10 second: 0)).

"Generamos Monthly billing"
billing := MonthlyBilling for: subscriber period: (Month year: 2024 month: 1).
billing generate.
billing printInvoice.
