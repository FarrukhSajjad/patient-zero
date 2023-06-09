using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    [SerializeField] private float movementSpeed = 5f;

    private bool isMoving = false;

    public Animator playerAnimator;

    private void Update()
    {
        if (Input.touchCount > 0 && Input.GetTouch(0).phase == TouchPhase.Began)
        {
            isMoving = true;
            playerAnimator.SetTrigger("ZombieRun");
        }

        if (isMoving)
        {
            transform.Translate(Vector3.forward * movementSpeed * Time.deltaTime);
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("Brain"))
        {
            Debug.Log("BRAIN COLLECTED");
        }
    }
}
