package com.example.counterapplication


import com.google.android.material.snackbar.Snackbar

import androidx.navigation.findNavController
import androidx.navigation.ui.AppBarConfiguration
import androidx.navigation.ui.navigateUp
import androidx.navigation.ui.setupActionBarWithNavController
import android.view.Menu
import android.view.MenuItem
import com.example.counterapplication.databinding.ActivityMainBinding
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
class MainActivity : AppCompatActivity() {

    private lateinit var appBarConfiguration: AppBarConfiguration
    private lateinit var binding: ActivityMainBinding


    private lateinit var countTextView: TextView
    private lateinit var incrementButton: Button
    private lateinit var decrementButton: Button
    private lateinit var resetButton: Button
    private var count = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        countTextView = findViewById(R.id.count_text_view)
        incrementButton = findViewById(R.id.increment_button)
        decrementButton = findViewById(R.id.decrement_button)
        resetButton = findViewById(R.id.reset_button)

        // Set initial count value
        countTextView.text = count.toString()

        // Increment button click listener
        incrementButton.setOnClickListener {
            count++
            countTextView.text = count.toString()
        }

        // Decrement button click listener
        decrementButton.setOnClickListener {
            if (count > 0) {
                count--
                countTextView.text = count.toString()
            }
        }
        // Reset button click listener
        resetButton.setOnClickListener {
            count = 0
            countTextView.text = count.toString()
        }
    }

}