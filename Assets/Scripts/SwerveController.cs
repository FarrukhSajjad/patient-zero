using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SwerveController : MonoBehaviour
{
    public float moveSpeed = 10f; // The speed at which the object will move
    public float moveThreshold = 0.1f; // The minimum distance the finger needs to move to trigger a move
    public float leftThreshold = -5f; // The left threshold of the object's movement
    public float rightThreshold = 5f; // The right threshold of the object's movement
    private bool isMoving = false; // Flag to check if the object is currently moving
    private Vector2 lastPosition; // The position of the finger in the last frame

    void Update()
    {
        if (Input.touchCount > 0) // Check if the user is touching the screen
        {
            Touch touch = Input.GetTouch(0);

            if (touch.phase == TouchPhase.Began) // If the touch just started, set the lastPosition variable
            {
                lastPosition = touch.position;
            }
            else if (touch.phase == TouchPhase.Moved) // If the touch is moving
            {
                float distanceMoved = touch.position.x - lastPosition.x; // Calculate the distance moved in the x-axis
                if (Mathf.Abs(distanceMoved) > moveThreshold) // Check if the distance moved is greater than the threshold
                {
                    isMoving = true;
                    Vector3 newPosition = transform.position + new Vector3(distanceMoved * moveSpeed * Time.deltaTime, 0, 0); // Calculate the new position of the object
                    newPosition.x = Mathf.Clamp(newPosition.x, leftThreshold, rightThreshold); // Clamp the x position of the object within the left and right thresholds
                    transform.position = newPosition; // Set the new position of the object
                }
            }
            else if (touch.phase == TouchPhase.Ended || touch.phase == TouchPhase.Canceled) // If the touch ended or was canceled, set isMoving to false
            {
                isMoving = false;
            }

            lastPosition = touch.position; // Set the lastPosition variable to the current position of the finger
        }

        // If the object is not currently moving, set its velocity to zero
        if (!isMoving)
        {
            GetComponent<Rigidbody>().velocity = Vector3.zero;
        }
    }
}
