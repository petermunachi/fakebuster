import * as React from 'react';
import Icon from 'react-native-vector-icons/MaterialCommunityIcons';
import { Button, View, Text, StatusBar, StyleSheet } from 'react-native';


function Navbar() {
  // const myIcon = ;
  return (
    <View style={styles.container}>
      
      <Icon name="menu" size={30} color="#5e5e5d" />

      <Text>FAKE BUSTER</Text>

      <Icon name="settings-helper" size={30} color="#5e5e5d" />

    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingTop: 8,
  },
  buttonContainer:{
    padding: 10
  },
  textStyle:{
    textAlign: 'center'
  }
});


export default Navbar;