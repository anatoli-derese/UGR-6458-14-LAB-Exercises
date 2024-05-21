package com.example.counterwithjetcompose

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewmodel.compose.viewModel

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            CounterApp()
        }
    }
}

@Composable
fun CounterApp() {
    val counterViewModel: CounterViewModel = viewModel()
    val count by counterViewModel.count

    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center,
        modifier = Modifier.fillMaxSize()
    ) {
        Text(text = "Count: $count", fontSize = 40.sp, modifier = Modifier.padding(16.dp))
        Row {
            Button(onClick = { counterViewModel.increment() }, modifier = Modifier.padding(8.dp)) {
                Text("Increment")
            }
            Button(onClick = { counterViewModel.decrement() }, modifier = Modifier.padding(8.dp)) {
                Text("Decrement")
            }
            Button(onClick = { counterViewModel.reset() }, modifier = Modifier.padding(8.dp)) {
                Text("Reset")
            }
        }
    }
}

class CounterViewModel : ViewModel() {
    private val _count = mutableStateOf(0)
    val count: State<Int> = _count

    fun increment() {
        _count.value += 1
    }

    fun decrement() {
        _count.value -= 1
    }

    fun reset() {
        _count.value = 0
    }
}
