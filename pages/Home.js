import React from 'react';
import { Button, View, StatusBar, StyleSheet } from 'react-native';
import Icon from 'react-native-vector-icons/FontAwesome';
import Navbar from '../components/Navbar'


function HomeScreen({ navigation }) {
  const myIcon = <Icon name="rocket" size={30} color="#900" />;
  return (
    <View style={styles.container}>
      <StatusBar backgroundColor="lightgray" />
      <Navbar />

      <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>

        <Button
          onPress={() => navigation.toggleDrawer()}
          title="Toggle Drawer"
        />

      </View>

    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    backgroundColor: '#ECF0F1',
  }
});


export default HomeScreen;