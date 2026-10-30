#include <G4RunManagerFactory.hh>
#include <G4Version.hh>
#include <TROOT.h>

#include <iostream>

int main() {
  std::cout << "Geant4 " << G4VERSION_NUMBER << ", ROOT " << gROOT->GetVersion()
            << std::endl;
  return 0;
}
