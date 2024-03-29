/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React, {useState} from 'react';
import type {Node} from 'react';
import {
  SafeAreaView,
  ScrollView,
  StatusBar,
  StyleSheet,
  Text,
  useColorScheme,
  NativeModules,
  Button,
  View,
  requireNativeComponent,
} from 'react-native';

import {
  Colors,
  DebugInstructions,
  Header,
  LearnMoreLinks,
  ReloadInstructions,
} from 'react-native/Libraries/NewAppScreen';

const Section = ({children, title}): Node => {
  const isDarkMode = useColorScheme() === 'dark';
  return (
    <View style={styles.sectionContainer}>
      <Text
        style={[
          styles.sectionTitle,
          {
            color: isDarkMode ? Colors.white : Colors.black,
          },
        ]}>
        {title}
      </Text>
      <Text
        style={[
          styles.sectionDescription,
          {
            color: isDarkMode ? Colors.light : Colors.dark,
          },
        ]}>
        {children}
      </Text>
    </View>
  );
};
const helloWorldModule = NativeModules.HelloWorld;
const HelloView = requireNativeComponent('HelloView');

const App: () => Node = () => {
  const isDarkMode = useColorScheme() === 'dark';
  const [infoText, setInfoText] = useState(11);
  const backgroundStyle = {
    backgroundColor: isDarkMode ? Colors.darker : Colors.lighter,
  };

  helloWorldModule.setInitialCount(infoText);
  return (
    <SafeAreaView style={backgroundStyle}>
      <StatusBar barStyle={isDarkMode ? 'light-content' : 'dark-content'} />
      <ScrollView
        contentInsetAdjustmentBehavior="automatic"
        style={backgroundStyle}>
        <HelloView style={{height: 100, width: 100}} />
        <View
          style={{
            backgroundColor: isDarkMode ? Colors.black : Colors.white,
          }}>
          <Section title="Step One">
            <Button title="Say Hi" onPress={() => helloWorldModule.sayHi()} />
          </Section>
          <Section title="Step Two">
            <Button
              title="Say My Name"
              onPress={() => helloWorldModule.sayMyName('BAF')}
            />
          </Section>
          <Section title="Step Three">
            <Button
              title="Counter"
              onPress={() => {
                helloWorldModule.counter(value => {
                  setInfoText(value);
                  console.log(value);
                });
              }}
            />
            <Text>{infoText}</Text>
          </Section>
          <Section title="Step Four">
            <Button
              title="Counter Promise"
              onPress={() => {
                helloWorldModule
                  .counterPromise()
                  .then(res => {
                    setInfoText(res);
                  })
                  .catch(e => {
                    alert('Negative');
                    console.log(e);
                  });
              }}
            />
          </Section>
          <Section title="Step Five">
            <Button
              title="Do Liveness"
              onPress={() => {
                helloWorldModule.doLiveness(value => {
                  console.log(value);
                  alert(value);
                });
              }}
            />
          </Section>
          <Section title="Debug">
            <DebugInstructions />
          </Section>
          <Section title="Learn More">
            Read the docs to discover what to do next:
          </Section>
          <LearnMoreLinks />
        </View>
      </ScrollView>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  sectionContainer: {
    marginTop: 32,
    paddingHorizontal: 24,
  },
  sectionTitle: {
    fontSize: 24,
    fontWeight: '600',
  },
  sectionDescription: {
    marginTop: 8,
    fontSize: 18,
    fontWeight: '400',
  },
  highlight: {
    fontWeight: '700',
  },
});

export default App;
