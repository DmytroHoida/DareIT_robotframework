# DareIT Robot Framework
```test_scouts_panel.robot``` includes 6 tests:

## [Scouts Panel](https://scouts-test.futbolkolektyw.pl/login) in testing environment 
`test_scouts_panel_testing_environment.robot`:
1. Successful login to the system / 
<span style="color: green; font-weight: 700">Pass</span>
2. Unsuccessful login to the system /
<span style="color: green; font-weight: 700">Pass</span>
3. Add a new player / 
<span style="color: green; font-weight: 700">Pass</span>
4. Check correctness of the added data / 
<span style="color: green; font-weight: 700">Pass</span>
5. Check age field validation with incorrect day /
<span style="color: green; font-weight: 700">Pass</span>
6. Check age field validation with incorrect year / 
<span style="color: red; font-weight: 700">Fail</span>

## [Scouts Panel](https://scouts.futbolkolektyw.pl/en/) in production environment 
`test_scouts_panel.robot`:
1. Successful login to the system / 
<span style="color: red; font-weight: 700">Fail</span>
2. Unsuccessful login to the system /
<span style="color: green; font-weight: 700">Pass</span>
3. Add a new player / 
<span style="color: red; font-weight: 700">Fail</span>
4. Check correctness of the added data / 
<span style="color: red; font-weight: 700">Fail</span>
5. Check age field validation with incorrect day /
<span style="color: red; font-weight: 700">Fail</span>
6. Check age field validation with incorrect year / 
<span style="color: red; font-weight: 700">Fail</span>

## [Scouts Panel](https://scouts.futbolkolektyw.pl/en/) in production environment (adjusted to the new required field)
`test_scouts_panel_adjusted_to_new_field.robot`:
1. Successful login to the system / 
<span style="color: red; font-weight: 700">Fail</span>
2. Unsuccessful login to the system /
<span style="color: green; font-weight: 700">Pass</span>
3. Add a new player / 
<span style="color: green; font-weight: 700">Pass</span>
4. Check correctness of the added data / 
<span style="color: red; font-weight: 700">Fail</span>
5. Check age field validation with incorrect day /
<span style="color: green; font-weight: 700">Pass</span>
6. Check age field validation with incorrect year / 
<span style="color: red; font-weight: 700">Fail</span>



Test cases can be found **[here](https://docs.google.com/document/d/1X3DFjroHfnqsJGr1CFoElh43ayTm5g8UsCDr9S5dOlE/edit?usp=sharing).** \
Bug reports and test report can be found **[here](https://drive.google.com/drive/folders/1UdlSytTsZakpol16aUVLBHTlMsKGhFTJ?usp=share_link).**