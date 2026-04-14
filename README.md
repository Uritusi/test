# LifeTracker iOS (SwiftUI)

Application mobile de tracking de vie pour **iPhone 15 Pro Max** (et autres iPhone iOS 17+), avec 3 piliers:

- Sport
- Sommeil
- Finance

## Fonctionnalités

- Dashboard global avec indicateurs clés du jour/mois.
- Gestion des séances de sport (type, durée, calories).
- Suivi du sommeil (heures + qualité sur 5).
- Suivi finance perso (revenus/dépenses + solde mensuel).
- Interface SwiftUI en `TabView`, adaptée au grand écran du 15 Pro Max.

## Arborescence

- `LifeTracker/LifeTrackerApp.swift` : point d'entrée de l'app.
- `LifeTracker/ContentView.swift` : navigation par onglets.
- `LifeTracker/Models/TrackingModels.swift` : modèles de données.
- `LifeTracker/ViewModels/LifeTrackerViewModel.swift` : logique métier / agrégations.
- `LifeTracker/Views/*` : écrans Dashboard, Sport, Sommeil, Finance.

## Lancer dans Xcode

1. Crée un nouveau projet iOS SwiftUI dans Xcode (si besoin).
2. Remplace les fichiers Swift générés par ceux du dossier `LifeTracker/`.
3. Choisis un simulateur **iPhone 15 Pro Max**.
4. Run (`⌘R`).

## Prochaine étape recommandée

- Persistance locale (`SwiftData` ou `Core Data`).
- Sync cloud (`CloudKit`).
- Widgets écran verrouillé et écran d'accueil.
- Graphiques hebdo/mensuels (`Charts`).
