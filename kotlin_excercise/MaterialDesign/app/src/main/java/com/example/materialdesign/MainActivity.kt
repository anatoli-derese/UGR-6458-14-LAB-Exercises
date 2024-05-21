package com.example.materialdesign

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import com.example.materialdesign.ui.theme.MaterialDesignTheme
import androidx.compose.material3.MaterialTheme.colorScheme as colorScheme1
import androidx.compose.material3.MaterialTheme.typography as typography1
import androidx.compose.material3.Surface as Surface1

// ...
class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            ComposeTutorialTheme {
                Surface1(modifier = Modifier.fillMaxSize()) {
                    MessageCard(Message("Android", "Jetpack Compose"))
                }
            }
        }
    }
}

//@Composable
//fun MessageCard(msg: Message) {
//    Column {
//        Text(text = msg.author)
//        Text(text = msg.body)
//    }
//}

@Preview
@Composable
fun PreviewMessageCard() {
    ComposeTutorialTheme {
        Surface1 {
            MessageCard(
                msg = Message("Lexi", "Take a look at Jetpack Compose, it's great!")
            )
        }
    }
}

// ...
import androidx.compose.material3.Surface

@Composable
fun MessageCard(msg: Message) {
    Row(modifier = Modifier.padding(all = 8.dp)) {
        Image(
            painter = painterResource(R.drawable.profile_picture),
            contentDescription = null,
            modifier = Modifier
                .size(40.dp)
                .clip(CircleShape)
                .border(1.5.dp, colorScheme1.primary, CircleShape)
        )
        Spacer(modifier = Modifier.width(8.dp))

        Column {
            Text(
                text = msg.author,
                color = colorScheme1.secondary,
                style = typography1.titleSmall
            )

            Spacer(modifier = Modifier.height(4.dp))

            Surface(shape = MaterialTheme.shapes.medium, shadowElevation = 1.dp) {
                Text(
                    text = msg.body,
                    modifier = Modifier.padding(all = 4.dp),
                    style = typography1.bodyMedium
                )
            }
        }
    }
}

// ...
import android.content.res.Configuration
//
//@Preview(name = "Light Mode")
//@Preview(
//    uiMode = Configuration.UI_MODE_NIGHT_YES,
//    showBackground = true,
//    name = "Dark Mode"
//)
//@Composable
//fun PreviewMessageCard() {
//    ComposeTutorialTheme {
//        Surface {
//            MessageCard(
//                msg = Message("Lexi", "Hey, take a look at Jetpack Compose, it's great!")
//            )
//        }
//    }
//}

  
