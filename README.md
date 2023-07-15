## FittedGridView
A FittedGridView is a widget that can fit its content inside the parent bounds and show it as a gridview.

<p align="left" dir="auto">
  <img src="https://github.com/ibrahimEltayfe/fitted_gridview/assets/40795940/1bcc1258-98b4-4210-aa1a-a374dd222856" style="max-width: 50%;">
</p>

## Getting started

```
 flutter pub add fitted_gridview
```

## Features

**maxItemDisplay**: defines max items to fit them inside the parent </br>
**itemCount**:  defines the number of your items</br>
**itemBuilder**: defines the widget to display </br>
**remainingItemsOverlay**: defines the widget on top of the last item that displays the number of remaining items</br>
**textDirection**: defines the direction of items</br>

## Usage

```dart
Container(
  width: 300,
  height: 300,
  decoration: BoxDecoration(
    border: Border.all(color: Colors.black)
  ),
  child: FittedGridView(
    maxItemDisplay: 4,
    itemCount: 4,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
          child: Image.network(
            images[index],
            fit: BoxFit.cover,
          ),
       );
     },
    remainingItemsOverlay: (remaining) {
      return Padding(
         padding: const EdgeInsets.all(4.0),
           child: Container(
             color: Colors.grey.withOpacity(0.7),
             alignment: Alignment.center,
             child: Text("+$remaining",style: const TextStyle(color: Colors.white),),
        ),
      );
    },
  ),
)
```

## TODO
- add MaxRows: adding property to customize a max rows of the gridview to fit elements in.
- add MaxColumns: adding property to customize a max columns of the gridview to fit elements in.


